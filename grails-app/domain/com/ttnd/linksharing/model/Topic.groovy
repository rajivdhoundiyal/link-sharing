package com.ttnd.linksharing.model

class Topic {

    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    Visibility visibility

    static constraints = {
        name blank: false, unique: true
        /*visibility validate : {
            if(visibility == null) {
                return false
            }
        }*/
    }

    static mapping = {
        createdBy cascade: 'none'
    }

    static belongsTo = [createdBy: User]
}
