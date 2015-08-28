package com.ttnd.linksharing.fakefactory

import com.ttnd.linksharing.model.Topic
import com.ttnd.linksharing.model.User
import com.ttnd.linksharing.model.Visibility

/**
 * Created by ttnd on 17/8/15.
 */
class TopicFakeFactory {

    static def createTopicPrivate() {
        def topic = new Topic()
        topic.dateCreated = new Date()
        topic.createdBy = UserFakeFactory.createUser()
        topic.lastUpdated = new Date()
        topic.name = "Test Topic"
        topic.visibility = Visibility.PRIVATE

        return topic
    }

    static def createTopicPublic() {
        def topic = new Topic()
        topic.dateCreated = new Date()
        topic.createdBy = UserFakeFactory.createUser()
        topic.lastUpdated = new Date()
        topic.name = "Test Topic"
        topic.visibility = Visibility.PUBLIC

        return topic
    }
}

