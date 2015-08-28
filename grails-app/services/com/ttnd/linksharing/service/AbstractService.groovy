package com.ttnd.linksharing.service

import com.ttnd.linksharing.model.Role
import com.ttnd.linksharing.model.Subscription
import com.ttnd.linksharing.model.UserRole
import grails.transaction.Transactional


@Transactional
abstract class AbstractService<T> {

    protected abstract Class<T> getReference();

    def T save(T clazz) {
        return clazz.save();
    }

    def T update(T clazz) {
        return clazz.save();
    }

    def T delete(T clazz) {
        return clazz.delete();
    }

    def T deleteById(Long id) {
        def clazz = getReference().findById(id);
        return clazz.delete();
    }

    def T get(def id) {
        return getReference().get(id)
    }

    def List<T> getAll() {
        return getReference().list();
    }
}
