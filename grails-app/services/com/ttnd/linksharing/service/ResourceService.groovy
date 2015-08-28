package com.ttnd.linksharing.service

import com.ttnd.linksharing.model.Resource
import com.ttnd.linksharing.model.ResourceRating
import com.ttnd.linksharing.model.Topic
import com.ttnd.linksharing.model.User
import com.ttnd.linksharing.model.Visibility
import grails.transaction.Transactional
import org.hibernate.FetchMode

@Transactional
class ResourceService extends AbstractService<Resource> {

    @Override
    Class getReference() {
        return Resource
    }

    List<Resource> findAllResourceByTopicName(String topicName) {
        return Resource.where {
            topic.name == topicName
        }.list()
    }

    List<Resource> findAllUnreadResourceByTopicName(String topicName) {
        return Resource.where {
            topic.name == topicName
            isRead != true
        }.list()
    }

    List<Resource> findAllResourceByPublicVisibility() {
        return Resource.where {
            topic.visibility == Visibility.PUBLIC
        }.list()
    }

    List<Resource> findAllPublicAndLatestResource() {
        return Resource.where {
            topic.visibility == Visibility.PUBLIC
            order('dateCreated', 'desc')
        }.list(max: 5)
    }

    List<Resource> findAllUnreadByUser(User user) {
        return Resource.findAllByCreatedByAndIsReadNotEqual(user, true)
    }

    Resource findByResourceId(Long id) {
        return Resource.findById(id)
    }

    List<Resource> findAllForTheMatchingTopicAndResourceDescription(String searchString) {

        def resourceQuery = Resource.executeQuery("from Resource as r where " +
                "r.description like :resource or r.topic.name like :topic",
                ["resource" : "%${searchString}%", "topic" : "%${searchString}%"])
        return resourceQuery.toList()
    }

}