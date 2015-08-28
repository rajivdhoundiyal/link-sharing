package com.ttnd.linksharing.service

import com.ttnd.linksharing.model.Subscription
import com.ttnd.linksharing.model.Topic
import com.ttnd.linksharing.model.User
import grails.transaction.Transactional

@Transactional
class SubscriptionService extends AbstractService {

    @Override
    Class getReference() {
        return Subscription
    }

    List<Subscription> findAllSubscriptionByUser(User user) {
        return Subscription.findAllByUser(user);
    }

    def countByTopic(Topic topic) {
        return Subscription.countByTopic(topic)
    }

    /*def findAllTrendingTopics() {

        def topicList = Subscription.executeQuery("select s from Resource as r, Topic as t, Subscription s where " +
                "t = r.topic and t = s.topic group by " +
                "r.topic order by count(r.topic) desc)", [max: 5]).toList();
        return topicList
    }*/

    List<User> findAllSubscribedUserByTopic(Topic topic) {
        List<User> users = Subscription.executeQuery("select u from Subscription as s join s.topic " +
                "as t join s.user as u where t = :topic", [topic: topic])
        return users
    }
}
