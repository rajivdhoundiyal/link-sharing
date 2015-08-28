package com.ttnd.linksharing

import com.ttnd.linksharing.fakefactory.TopicFakeFactory
import com.ttnd.linksharing.model.Seriousness
import com.ttnd.linksharing.model.Visibility
import grails.test.spock.IntegrationSpec

import static junit.framework.Assert.assertEquals
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

class TopicServiceIntegrationSpec extends IntegrationSpec {

    def setup() {
    }

    def cleanup() {
    }

    def topicService
    
    void "test topic is saved"() {
        given: "A topic"
        def topic = TopicFakeFactory.createTopicPrivate()

        when: "Topic is saved in database"
        def savedTopic = topicService.save(topic    );

        then: "Save should return the persisted topic"
        assertEquals(savedTopic, topic)
        assertFalse(topic.errors.hasErrors())

    }

    void "test topic is deleted"() {
        given: "A topic"
        def topic = TopicFakeFactory.createTopicPrivate()

        when: "Topic is deleted from database"
        topic = topicService.save(topic)
        def subscriptionId = topic.id;
        topicService.delete(topic)
        def deletedTopic = topicService.get(subscriptionId)

        then: "Persisted topic should be deleted"
        assertNull(deletedTopic)
        assertFalse(topic.errors.hasErrors())
    }

    void "test topic is updated"() {
        given: "A topic"
        def topic = TopicFakeFactory.createTopicPrivate()

        when: "Topic is updated in database"
        topic = topicService.save(topic)
        topic.visibility = Visibility.PUBLIC
        def updatedTopic = topicService.update(topic);

        then: "Updated topic should return from database"
        assertEquals(updatedTopic, topic)
        assertFalse(topic.errors.hasErrors())
        assertFalse(updatedTopic.errors.hasErrors())
        assertEquals(Visibility.PUBLIC, updatedTopic.visibility)
    }

    void "test get a topic"() {
        given: "A topic id"
        def topic = TopicFakeFactory.createTopicPrivate()

        when: "Topic looked up"
        topic = topicService.save(topic)
        def lookedUpTopic = topicService.get(topic.id);

        then: "Updated topic should return from database"
        assertNotNull(lookedUpTopic)
        assertFalse(topic.errors.hasErrors())
        assertFalse(lookedUpTopic.errors.hasErrors())
    }

    void "test get list of subscriptions"() {
        given: "A list of users"
        def subscriptions = createTopicList()

        when: "User looked up"
        subscriptions.each {
            topicService.save(it)
        }
        def subscriptionList = topicService.getAll()

        then: "Updated user should return from database"
        assertEquals(2, subscriptionList.size())
        assertNotNull(subscriptionList)
        subscriptions.each {
            assertFalse(it.errors.hasErrors())
        }
    }

    def createTopicList() {
        def topic = TopicFakeFactory.createTopicPrivate()
        def topic2 = TopicFakeFactory.createTopicPrivate()
        return [topic, topic2]
    }
}
