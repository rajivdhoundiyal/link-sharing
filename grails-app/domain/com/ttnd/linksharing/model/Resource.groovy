package com.ttnd.linksharing.model

class Resource {

    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated
    Boolean isRead = false

    static constraints = {

    }

    static belongsTo = [topic: Topic, createdBy: User]
}
