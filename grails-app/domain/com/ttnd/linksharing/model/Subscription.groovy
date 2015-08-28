package com.ttnd.linksharing.model

class Subscription {

    Topic topic
    User user
    Seriousness seriousness
    Date dateCreated

    static constraints = {
    }

    static mapping = {
        topic cascade: 'none'
        user cascade: 'none'
    }

    static belongsTo = [user: User, topic: Topic]

}
