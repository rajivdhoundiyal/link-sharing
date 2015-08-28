package com.ttnd.linksharing.service

import com.ttnd.linksharing.model.User
import com.ttnd.linksharing.model.UserRole
import grails.transaction.Transactional

@Transactional
class UserService<T> extends AbstractService {

    Class<T> getReference() {
        return User.class
    }

    User findUserByUserName(String userName) {
        return User.findByUsername(userName)
    }
}