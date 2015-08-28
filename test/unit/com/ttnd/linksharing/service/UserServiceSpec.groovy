package com.ttnd.linksharing.service

import com.ttnd.linksharing.model.User
import grails.test.mixin.Mock
import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(UserService)
@Mock(User)
class UserServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    /*void "test user is saved"() {
        given: "A user"
        def user = createUser();

        when: "User is saved in database"
        def savedUser = service.save(user);

        then: "Save should return the persisted user"
        assertEquals(savedUser, user)

    }

    void "test user is deleted"() {
        given: "A user"
        def user = createUser();

        when: "User is deleted from database"
        user = service.save(user)
        def userId = user.id;
        service.delete(user)
        def deletedUser = service.get(userId)

        then: "Persisted user should be deleted"
        assertNull(deletedUser)
    }

    void "test user is updated"() {
        given: "A user"
        def user = createUser();

        when: "User is updated in database"
        def updatedUser = service.update(user);

        then: "Updated user should return from database"
        assertEquals(updatedUser, user)
    }

    void "test get a user"() {
        given: "A user id"
        def userId = 1;
        def user = createUser();

        when: "User looked up"
        user = service.save(user)
        def lookedUpUser = service.get(user.id);

        then: "Updated user should return from database"
        assertNotNull(lookedUpUser)

    }

    void "test get list of users"() {
        given: "A list of users"
        def users = createUserList()

        when: "User looked up"
        users.each {
            service.save(it)
        }
        def usersList = service.getAll()

        then: "Updated user should return from database"
        assertEquals(2, usersList.size())
        assertNotNull(usersList)

    }

    private def createUser() {
        def user = new User()
        return user
    }

    private List<User> createUserList() {
        def user = new User()
        def user1 = new User()
        return [user, user1]
    }*/
}
