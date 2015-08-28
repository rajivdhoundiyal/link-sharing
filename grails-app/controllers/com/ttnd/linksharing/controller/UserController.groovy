package com.ttnd.linksharing.controller

import com.ttnd.linksharing.model.Resource
import com.ttnd.linksharing.model.Role
import com.ttnd.linksharing.model.Subscription
import com.ttnd.linksharing.model.User
import com.ttnd.linksharing.model.UserRole
import grails.plugin.springsecurity.annotation.Secured

class UserController {

    def index() {}

    def userService
    def userRoleService
    def resourceService
    def subscriptionService

    def registerUser() {

        User user = new User()
        user.properties = params

        user.active = true
        user.accountExpired = false
        user.accountLocked = false
        user.enabled = true
        user.passwordExpired = false
        user.admin = false

        if (!user.validate()) {
            println user.hasErrors()
            flash.user = user
            redirect(controller: 'home', action: 'home')
        } else {
            userService.save(user)

            if (user.hasErrors()) {
                throw RuntimeException("Error Saving Bean" + user.errors)
            }

            Role role = Role.findByAuthority("ROLE_USER")

            if (role == null) {
                throw RuntimeException("Error Saving Bean" + user.errors)
            }

            UserRole userRole = new UserRole(user: user, role: role);

            userRoleService.create(user, role)
            //user.authorities = [role]


            redirect(controller: "home", action: 'registrationSucessfull')
        }
    }

    @Secured(['ROLE_DASHBOARD', 'ROLE_ADMIN', 'ROLE_USER'])
    def showProfile() {

        User user = userService.findUserByUserName(params.username)
        List<Resource>  resources = resourceService.findAllUnreadByUser(user)
        List<Subscription> subscriptionList = subscriptionService.findAllSubscriptionByUser(user)
        render(view: 'showprofile', model: [resources: resources, user: user, subscriptions: subscriptionList])
    }
}
