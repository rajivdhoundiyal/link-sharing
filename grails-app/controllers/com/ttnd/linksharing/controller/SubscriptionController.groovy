package com.ttnd.linksharing.controller

import com.ttnd.linksharing.model.Resource
import com.ttnd.linksharing.model.Subscription
import grails.plugin.springsecurity.annotation.Secured

class SubscriptionController {

    def resourceService
    def subscriptionService
    def springSecurityService

    def index() {}

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN'])
    def viewAll() {

        def user = springSecurityService.loadCurrentUser()



        List<Subscription> subscriptionList = subscriptionService.findAllSubscriptionByUser(user)
        render(view: "viewAllSubscription", model: [user: user, subscriptions: subscriptionList, showToolbar: true])
    }

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN'])
    def postPagination() {
        def user = springSecurityService.loadCurrentUser()
        List<Resource> resourceList = resourceService.findAllUnreadByUser(user)
        [resource: resourceList, size: resourceList.size()]
    }

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN'])
    def deleteSubscription() {
        Long id = Long.valueOf(params.id)
        def user = springSecurityService.loadCurrentUser()

        try {

            subscriptionService.deleteById(id)

            List<Subscription> subscriptionList = subscriptionService.findAllSubscriptionByUser(user)

            redirect(controller: "dashboard", action: "show")

        } catch (Exception e) {
            e.printStackTrace()
            render(staus: 403, text: "Unexpected exception while deleting object")
        }

    }
}
