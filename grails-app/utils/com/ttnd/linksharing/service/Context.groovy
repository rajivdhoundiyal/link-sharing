package com.ttnd.linksharing.service

import org.springframework.stereotype.Component
import org.springframework.stereotype.Service
import org.springframework.web.bind.annotation.SessionAttributes
import org.springframework.web.context.request.SessionScope

/**
 * Created by ttnd on 20/8/15.
 */

@Singleton
@Component
@SessionAttributes
class Context {

    private final static Map<Object, Object> map = new HashMap<>();

    def getProperty(Object obj) {
        return map.get(obj)
    }

    def setProperty(Object key, Object value) {
        map.put(key, value)
    }
}
