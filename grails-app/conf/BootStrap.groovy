import com.ttnd.linksharing.model.DocumentResource
import com.ttnd.linksharing.model.LinkResource
import com.ttnd.linksharing.model.Resource
import com.ttnd.linksharing.model.Role
import com.ttnd.linksharing.model.Seriousness
import com.ttnd.linksharing.model.Subscription
import com.ttnd.linksharing.model.Topic
import com.ttnd.linksharing.model.User
import com.ttnd.linksharing.model.UserRole
import com.ttnd.linksharing.model.Visibility


class BootStrap {

    def mailService

    def init = { servletContext ->
        Role roleUser = new Role();
        roleUser.authority = "ROLE_USER"

        Role roleAdmin = new Role();
        roleAdmin.authority = "ROLE_ADMIN"

        Role roleUserDash = new Role();
        roleUserDash.authority = "ROLE_DASHBOARD"

        roleUser.save(flush: true)
        roleAdmin.save(flush: true)
        roleUserDash.save(flush: true)

        User user = new User(username: 'rajiv', password: 'rajiv',
                email: 'rajiv@rajiv.com', firstName: 'Rajiv', lastName: 'Kumar', admin: false, active: true
        )

        User user2 = new User(username: 'mohit', password: 'mohit',
                email: 'mohit@mohit.com', firstName: 'Mohit', lastName: 'Kumar', admin: false, active: true
        )

        user.save(flush: true)
        user2.save(flush: true)

        UserRole userRole = new UserRole(user: user, role: roleUser);
        UserRole userRoleDash = new UserRole(user: user, role: roleUserDash);
        UserRole userRole2 = new UserRole(user: user2, role: roleAdmin);
        userRole.save(flush: true)
        userRole2.save(flush: true)
        userRoleDash.save(flush: true)

        Topic topic = new Topic(createdBy: user, name: "Grails", visibility:  Visibility.PRIVATE)
        Topic topic2 = new Topic(createdBy: user, name: "Mongo", visibility:  Visibility.PUBLIC)
        Topic topic3 = new Topic(createdBy: user, name: "Node", visibility:  Visibility.PUBLIC)


        topic.save(flush: true)
        topic2.save(flush: true)
        topic3.save(flush: true)

        println topic.errors

        Topic topicUser2 = new Topic(createdBy: user2, name: "Jboss", visibility:  Visibility.PRIVATE)
        Topic topic2User2 = new Topic(createdBy: user2, name: "Tomcat", visibility:  Visibility.PUBLIC)
        Topic topic3User2 = new Topic(createdBy: user2, name: "Websphere", visibility:  Visibility.PUBLIC)

        topicUser2.save(flush: true)
        topic2User2.save(flush: true)
        topic3User2.save(flush: true)

        Resource resource = new LinkResource(description: "The way of learning grails.", createdBy: user
                , dateCreated: new Date(month: 7), topic: topic, isRead: false, url: 'www.google.com')
        Resource resource4 = new LinkResource(description: "A new way to learn and quickly create the webapplication. Merge well with agile.", createdBy: user
                , dateCreated: new Date(month: 7), topic: topic2, isRead: false, url: 'www.yahoo.com')

        Resource resource2 = new DocumentResource(description: "The way of learning grails. A new way to learn and quickly create the webapplication. Merge well with agile.", createdBy: user
                , dateCreated: new Date(month: 7), topic: topic2, isRead: false, filePath: '/home/ttnd/linksharing/apple-touch-icon-retina_1440498270971.png')

        Resource resource3 = new DocumentResource(description: "The way of learning grails. A new way to learn and quickly create the webapplication. Merge well with agile.", createdBy: user2
                , dateCreated: new Date(month: 7), topic: topic2User2, isRead: false, url: '/home/ttnd/linksharing/apple-touch-icon-retina_1440498270971.png')

        resource.save(flush: true)
        resource2.save(flush: true)
        resource3.save(flush: true)
        resource4.save(flush: true)

        Subscription subscription = new Subscription(user: user, topic: topic, seriousness: Seriousness.CASUAL)
        Subscription subscription1 = new Subscription(user: user, topic: topic2User2, seriousness: Seriousness.SERIOUS)
        Subscription subscription2 = new Subscription(user: user, topic: topic3, seriousness: Seriousness.VERY_SERIOUS)
        Subscription subscription4 = new Subscription(user: user2, topic: topic3, seriousness: Seriousness.VERY_SERIOUS)

        subscription.save(flush: true)
        subscription1.save(flush: true)
        subscription2.save(flush: true)
        subscription4.save(flush: true)

        Subscription subscriptionU2 = new Subscription(user: user2, topic: topicUser2, seriousness: Seriousness.CASUAL)
        /*Subscription subscription1U2 = new Subscription(user: user2, topic: topic2, seriousness: Seriousness.SERIOUS)*/
        Subscription subscription2U2 = new Subscription(user: user2, topic: topic3User2, seriousness: Seriousness.VERY_SERIOUS)

        subscriptionU2.save(flush: true)
        /*subscription1U2.save()*/
        subscription2U2.save(flush: true)

        /*mailService.sendMail {
        }*/
    }

    def destroy = {
    }
}
