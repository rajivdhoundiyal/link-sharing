package com.ttnd.linksharing.fakefactory

import com.ttnd.linksharing.model.User

/**
 * Created by ttnd on 17/8/15.
 */
class UserFakeFactory {

    static def createUser() {
        def user = new User()
        user.email = "test@test.com"
        user.active = true
        user.admin = true
        /*user.dateCreated = new Date()*/
        user.firstName = "First Name"
        user.lastName = "Last Name"
        /*user.lastUpdated =  new Date()*/
        user.password = "ABCD"
        user.photo = new byte[4]
        user.userName = "TestUser"
        return user
    }
}
