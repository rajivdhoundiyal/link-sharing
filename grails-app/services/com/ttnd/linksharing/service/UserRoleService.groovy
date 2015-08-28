package com.ttnd.linksharing.service

import com.ttnd.linksharing.model.Role
import com.ttnd.linksharing.model.User
import com.ttnd.linksharing.model.UserRole
import grails.transaction.Transactional

@Transactional
class UserRoleService<T> extends AbstractService {

    @Override
    Class<T> getReference() {
        return UserRole
    }

    def create(User user, Role role) {
        getReference().create(user, role, true)
    }

}
