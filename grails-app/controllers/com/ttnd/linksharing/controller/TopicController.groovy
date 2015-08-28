package com.ttnd.linksharing.controller

import com.ttnd.linksharing.model.Resource
import com.ttnd.linksharing.model.Seriousness
import com.ttnd.linksharing.model.Subscription
import com.ttnd.linksharing.model.Topic
import com.ttnd.linksharing.model.User
import com.ttnd.linksharing.model.Visibility
import grails.plugin.springsecurity.annotation.Secured

class TopicController {

    def topicService
    def resourceService
    def subscriptionService
    def springSecurityService

    def index() {}

    @Secured(['ROLE_USER', 'ROLE_ADMIN',])
    def show() {
        List<Topic> topics = topicService.findAllTopicsByVisibility(Visibility.PUBLIC)
        render(view: 'viewTopic', model: [topics: topics])
    }

    @Secured(['IS_AUTHENTICATED_ANONYMOUSLY'])
    def topic() {
        def topicName = params.name
        log.debug("Topic name in request is " + topicName)
        Topic topicDB = topicService.findTopicByName(topicName)
        List<Resource> resourceList = resourceService.findAllResourceByTopicName(topicName)
        List<User> usersList = subscriptionService.findAllSubscribedUserByTopic(topicDB)

        render(view: 'viewTopic', model: [topic: topicDB, resources: resourceList, users: usersList])
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN',])
    def createTopic() {

        Topic topic = new Topic()
        topic.name = params.name
        topic.createdBy = springSecurityService.loadCurrentUser()

        Subscription subscription = new Subscription()
        subscription.topic = topic
        subscription.seriousness = Seriousness.VERY_SERIOUS
        subscription.user = springSecurityService.loadCurrentUser()

        try {
            print(Visibility.getVisibility(params.visibility))
            topic.visibility = Visibility.getVisibility(params.visibility)

            if (topic.validate() && subscription.validate()) {
                topicService.save(topic)
                subscriptionService.save(subscription)
                render "Success"
            } else {
                render(status: 403, text: 'Request failed to complete due to some error.')
            }
        } catch (Exception e ) {
            render(status: 403, text: 'Request failed to complete due to some error.')
        }
    }

    @Secured(['ROLE_USER', 'ROLE_ADMIN',])
    def deleteTopic() {

    }
}
