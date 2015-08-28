package com.ttnd.linksharing.fakefactory

import com.ttnd.linksharing.model.Seriousness
import com.ttnd.linksharing.model.Subscription
import com.ttnd.linksharing.model.Topic

/**
 * Created by ttnd on 17/8/15.
 */
class SubscriptionFakeFactory {

    static def createSubscriptionCasualAndTopicPrivate() {
        def subscription = new Subscription();
        subscription.dateCreated = new Date()
        subscription.seriousness = Seriousness.CASUAL
        subscription.topic = TopicFakeFactory.createTopicPrivate()
        subscription.user = UserFakeFactory.createUser()

        return subscription
    }

    static def createSubscriptionSeriousAndTopicPrivate() {
        def subscription = new Subscription();
        subscription.dateCreated = new Date()
        subscription.seriousness = Seriousness.SERIOUS
        subscription.topic = TopicFakeFactory.createTopicPrivate()
        subscription.user = UserFakeFactory.createUser()

        return subscription
    }

    static def createSubscriptionVerySeriousAndTopicPrivate() {
        def subscription = new Subscription();
        subscription.dateCreated = new Date()
        subscription.seriousness = Seriousness.VERY_SERIOUS
        subscription.topic = TopicFakeFactory.createTopicPrivate()
        subscription.user = UserFakeFactory.createUser()

        return subscription
    }

}
