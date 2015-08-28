package com.ttnd.linksharing.service

import com.ttnd.linksharing.model.Resource
import com.ttnd.linksharing.model.Topic
import com.ttnd.linksharing.model.Visibility
import grails.gorm.DetachedCriteria
import grails.transaction.Transactional
import org.hibernate.criterion.CriteriaSpecification
import org.hibernate.criterion.Order

@Transactional
class TopicService extends AbstractService {

    @Override
    Class getReference() {
        return Topic
    }

    List<Topic> findAllTopicsByVisibility(Visibility visibility) {
        return Topic.findAllByNameAndVisibility(visibility)
    }

    Topic findTopicByName(String name) {
        return Topic.findByName(name)
    }

    List<Topic> findAllTrendingTopics() {

        def topicList = Resource.executeQuery("select r.topic from Resource as r, Topic as t where t = r.topic group by " +
                "r.topic order by count(r.topic) desc)", [max: 5]).toList();
        return topicList
    }
}
