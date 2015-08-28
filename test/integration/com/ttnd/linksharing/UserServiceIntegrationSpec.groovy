package com.ttnd.linksharing

import com.ttnd.linksharing.fakefactory.UserFakeFactory

import static junit.framework.Assert.assertEquals
import static junit.framework.Assert.assertFalse
import static junit.framework.Assert.assertNotNull
import static junit.framework.Assert.assertNull

import com.ttnd.linksharing.model.User
import grails.test.spock.IntegrationSpec


class UserServiceIntegrationSpec extends IntegrationSpec {

    def setup() {
    }

    def cleanup() {
    }

    def userService;
    
    void "test user is saved"() {
        given: "A user"
        def user = UserFakeFactory.createUser();

        when: "User is saved in database"
        def savedUser = userService.save(user);

        then: "Save should return the persisted user"
        assertEquals(savedUser, user)
        assertFalse(user.errors.hasErrors())

    }

    void "test user is deleted"() {
        given: "A user"
        def user = UserFakeFactory.createUser();

        when: "User is deleted from database"
        user = userService.save(user)
        def userId = user.id;
        userService.delete(user)
        def deletedUser = userService.get(userId)

        then: "Persisted user should be deleted"
        assertNull(deletedUser)
        assertFalse(user.errors.hasErrors())
    }

    void "test user is updated"() {
        given: "A user"
        def user = UserFakeFactory.createUser();

        when: "User is updated in database"
        user = userService.save(user);
        user.firstName = "First Name Changed"
        def updatedUser = userService.update(user);

        then: "Updated user should return from database"
        assertEquals(updatedUser, user)
        assertFalse(user.errors.hasErrors())
        assertFalse(updatedUser.errors.hasErrors())
        assertEquals("First Name Changed", updatedUser.firstName)
    }

    void "test get a user"() {
        given: "A user id"
        def userId = 1;
        def user = UserFakeFactory.createUser();

        when: "User looked up"
        user = userService.save(user)
        def lookedUpUser = userService.get(user.id);

        then: "Updated user should return from database"
        assertNotNull(lookedUpUser)
        assertFalse(user.errors.hasErrors())
        assertFalse(lookedUpUser.errors.hasErrors())
    }

    void "test get list of users"() {
        given: "A list of users"
        def users = createUserList()

        when: "User looked up"
        users.each {
            userService.save(it)
        }
        def usersList = userService.getAll()

        then: "Updated user should return from database"
        assertEquals(2, usersList.size())
        assertNotNull(usersList)
        users.each {
            assertFalse(it.errors.hasErrors())
        }
    }

    private List<User> createUserList() {
        def user = UserFakeFactory.createUser()
        def user1 = UserFakeFactory.createUser()
        return [user, user1]
    }
}
