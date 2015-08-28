package com.ttnd.linksharing

import com.ttnd.linksharing.fakefactory.SubscriptionFakeFactory
import com.ttnd.linksharing.model.Seriousness
import com.ttnd.linksharing.model.Subscription
import com.ttnd.linksharing.model.Topic
import grails.test.spock.IntegrationSpec

import static junit.framework.Assert.assertEquals
import static junit.framework.Assert.assertEquals
import static junit.framework.Assert.assertEquals
import static junit.framework.Assert.assertFalse
import static junit.framework.Assert.assertFalse
import static junit.framework.Assert.assertFalse
import static junit.framework.Assert.assertFalse
import static junit.framework.Assert.assertFalse
import static junit.framework.Assert.assertFalse
import static junit.framework.Assert.assertFalse
import static junit.framework.Assert.assertNotNull
import static junit.framework.Assert.assertNotNull
import static junit.framework.Assert.assertNull

class SubscriptionServiceIntegrationSpec extends IntegrationSpec {

    def setup() {
    }

    def cleanup() {
    }

    def subscriptionService

    void "test subscription is saved"() {
        given: "A subscription"
        def subscription = SubscriptionFakeFactory.createSubscriptionCasualAndTopicPrivate()

        when: "Subscription is saved in database"
        def savedSubscription = subscriptionService.save(subscription);

        then: "Save should return the persisted subscription"
        assertEquals(savedSubscription, subscription)
        assertFalse(subscription.errors.hasErrors())

    }

    void "test subscription is deleted"() {
        given: "A subscription"
        def subscription = SubscriptionFakeFactory.createSubscriptionCasualAndTopicPrivate()

        when: "Subscription is deleted from database"
        subscription = subscriptionService.save(subscription)
        def subscriptionId = subscription.id;
        subscriptionService.delete(subscription)
        def deletedSubscription = subscriptionService.get(subscriptionId)

        then: "Persisted subscription should be deleted"
        assertNull(deletedSubscription)
        assertFalse(subscription.errors.hasErrors())
    }

    void "test subscription is updated"() {
        given: "A subscription"
        def subscription = SubscriptionFakeFactory.createSubscriptionCasualAndTopicPrivate()

        when: "Subscription is updated in database"
        subscription = subscriptionService.save(subscription)
        subscription.seriousness = Seriousness.SERIOUS
        def updatedSubscription = subscriptionService.update(subscription);

        then: "Updated subscription should return from database"
        assertEquals(updatedSubscription, subscription)
        assertFalse(subscription.errors.hasErrors())
        assertFalse(updatedSubscription.errors.hasErrors())
        assertEquals(Seriousness.SERIOUS, updatedSubscription.seriousness)
    }

    void "test get a subscription"() {
        given: "A subscription id"
        def subscription = SubscriptionFakeFactory.createSubscriptionCasualAndTopicPrivate()

        when: "Subscription looked up"
        subscription = subscriptionService.save(subscription)
        def lookedUpSubscription = subscriptionService.get(subscription.id);

        then: "Updated subscription should return from database"
        assertNotNull(lookedUpSubscription)
        assertFalse(subscription.errors.hasErrors())
        assertFalse(lookedUpSubscription.errors.hasErrors())
    }

    void "test get list of subscriptions"() {
        given: "A list of users"
        def subscriptions = createSubscriptionList()

        when: "User looked up"
        subscriptions.each {
            subscriptionService.save(it)
        }
        def subscriptionList = subscriptionService.getAll()

        then: "Updated user should return from database"
        assertEquals(2, subscriptionList.size())
        assertNotNull(subscriptionList)
        subscriptions.each {
            assertFalse(it.errors.hasErrors())
        }
    }

    def createSubscriptionList() {
        def subscription = SubscriptionFakeFactory.createSubscriptionCasualAndTopicPrivate()
        def subscription2 = SubscriptionFakeFactory.createSubscriptionSeriousAndTopicPrivate()
        return [subscription, subscription2]
    }

}
