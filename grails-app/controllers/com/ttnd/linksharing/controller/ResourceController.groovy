package com.ttnd.linksharing.controller

import com.ttnd.linksharing.model.Resource
import com.ttnd.linksharing.model.ResourceRating
import com.ttnd.linksharing.model.Subscription
import com.ttnd.linksharing.model.Topic
import com.ttnd.linksharing.model.User
import com.ttnd.linksharing.service.ResourceRatingService
import com.ttnd.linksharing.service.TopicService
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

class ResourceController {

    def resourceService
    TopicService topicService
    def springSecurityService
    ResourceRatingService resourceRatingService

    def index() {}

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN', 'ROLE_USER'])
    def viewPost() {

        Long postId = Long.valueOf(params.postId)

        Resource resource = resourceService.findByResourceId(postId)
        ResourceRating resourceRating = resourceRatingService.findByResource(resource)

        if(resourceRating == null) {
            resourceRating = new ResourceRating()
        }

        List<Topic> trendingTopics = topicService.findAllTrendingTopics()


        render(view: 'viewPost', model: [resource: resource, trendingTopics: trendingTopics, resourceRating: resourceRating])
    }


    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN', 'ROLE_USER'])
    def markAsRead() {

        def resourceId = params.resourceId

        Resource resource = resourceService.findByResourceId(Long.valueOf(resourceId))
        def user = springSecurityService.loadCurrentUser()

        resource.isRead = true
        try {

            if (resource.validate()) {
                resourceService.save(resource)

                List<Resource> resourceList = resourceService.findAllUnreadByUser(user)
                render(template: "/subscription/posts", status: 200, model: [resources: resourceList])
            } else {
                render(status: 403, text: "Error in validation.")
            }
        } catch (Exception e) {
            render(status: 403, text: "Exception in updating record.")
        }
    }

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN', 'ROLE_USER'])
    def markAsReadForTopic() {

        def resourceId = params.resourceId
        def topicName = params.topicName

        Resource resource = resourceService.findByResourceId(Long.valueOf(resourceId))
        def user = springSecurityService.loadCurrentUser()

        resource.isRead = true
        try {

            if (resource.validate()) {
                resourceService.update(resource)

                List<Resource> resourceList = resourceService.findAllUnreadResourceByTopicName(topicName)
                render(template: "/subscription/posts", status: 200, model: [resources: resourceList])
            } else {
                render(status: 403, text: "Error in validation.")
            }
        } catch (Exception e) {
            render(status: 403, text: "Exception in updating record.")
        }
    }

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN', 'ROLE_USER'])
    def resourceRating() {

        def rating = Integer.valueOf(params.rating)
        def resourceId = Long.valueOf(params.resourceId)

        print(resourceId)
        try {

            Resource resource = resourceService.get(resourceId)
            println(resource)

            println(springSecurityService)
            ResourceRating resourceRating = resourceRatingService.findByResource(resource)
            User user = springSecurityService.loadCurrentUser()

            def isUpdate = true

            if (resourceRating == null) {
                isUpdate = false
            }

            if (isUpdate) {
                resourceRating.resource = resource
                resourceRating.user = user
                resourceRating.score = rating
            } else {
                resourceRating = new ResourceRating(resource: resource, user: user, score: rating)
            }

            if (resourceRating.validate()) {
                if(isUpdate) {
                    resourceRatingService.update(resourceRating)
                } else {
                    resourceRatingService.save(resourceRating)
                }

                render(status: 200, text: 'Rating done successfully')
            } else {
                log.debug(resourceRating.errors)
                render(status: 403, text: "Exception while validating resource rating")
            }
        } catch (Exception e) {
            e.printStackTrace()
            render(status: 403, text: "Exception while saving resource rating")
        }
    }

}
