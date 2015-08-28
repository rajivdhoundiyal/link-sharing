package com.ttnd.linksharing.controller

import com.ttnd.linksharing.model.Resource
import com.ttnd.linksharing.model.ResourceRating
import com.ttnd.linksharing.model.Subscription
import com.ttnd.linksharing.model.Topic
import com.ttnd.linksharing.service.ResourceService
import com.ttnd.linksharing.service.SubscriptionService
import grails.plugin.springsecurity.annotation.Secured

class DashboardController {

    def springSecurityService
    ResourceService resourceService
    SubscriptionService subscriptionService
    def topicService

    def index() { }

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN'])
    def show() {

        def user = springSecurityService.loadCurrentUser()

        List<Resource> resourceList = resourceService.findAllUnreadByUser(user)

        List<Subscription> subscriptionList = subscriptionService.findAllSubscriptionByUser(user)

        List<Topic> trendingTopics = topicService.findAllTrendingTopics()

        render(view: "viewDashboard", model: [user: user, resources: resourceList,
                                              subscriptions: subscriptionList, showToolbar: true, trendingTopics: trendingTopics])
    }

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN', 'ROLE_USER'])
    def viewPostsBasedOnSearch() {

        println(params.search)
        def search = params.search

        List<Resource> resourceList = resourceService.findAllForTheMatchingTopicAndResourceDescription(search)

        render(template: '/subscription/posts', model: [title: 'Inbox', showSearchInput: true, resources: resourceList, search: search])
    }
}
