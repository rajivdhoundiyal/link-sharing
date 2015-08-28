package com.ttnd.linksharing.model

class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	String email
	String firstName
	String lastName
    String confirmPassword
	byte [] photo
	Boolean admin
	Boolean active
	Date dateCreated
	Date lastUpdated

	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	User(String username, String password) {
		//this()
		this.username = username
		this.password = password
	}

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	static transients = ['springSecurityService', 'confirmPassword']

	static constraints = {
		username blank: false, unique: true, maxSize: 100, nullable: false
		password blank: false, maxSize: 100
        email blank: false, maxSize: 200
        firstName blank: false, maxSize: 500
        lastName blank: false, maxSize: 500
        photo(nullable:true, maxSize: 16384)
       /* confirmPassword validator: { password, obj ->
            if(obj.password == obj.confirmPassword) {
                return true
            }
            return ['incorrect password']
        }*/
	}

	static mapping = {
		password column: '`password`'
	}

	static hasMany = [resource: Resource]
}
