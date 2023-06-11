component
	extends  ="quick.models.BaseEntity"
	accessors="true"
	table    ="tblusers"
{

	// Dependancies
	property
		name      ="bcrypt"
		inject    ="@BCrypt"
		persistent="false";

	// non persisted properties
	property name="passwordConfirmation" persistent="false";

	// persisted properties
	property name="id" column="user_id";
	property name="email";
	property name="password" setter=false;
	property name="active" casts="BooleanCast@quick";

	this.memento = { neverInclude : [ "password" ] };

	public User function setPassword( required string password ){
		return assignAttribute( "password", bcrypt.hashPassword( arguments.password ) );
	}


	/**
	 * authentication methods
	 */
	public boolean function hasPermission( required string permission ){
		return true;
	}

	public boolean function isValidCredentials( required string email, required string password ){
		var user = newEntity()
			.where( "email", arguments.email )
			.where( "active", 1 )
			.first();
		if ( isNull( user ) ) {
			return false;
		}
		return bcrypt.checkPassword( arguments.password, user.getPassword() );
	}

	public User function retrieveUserByUsername( required string email ){
		return newEntity().where( "email", arguments.email ).firstOrFail();
	}

	public User function retrieveUserById( required numeric id ){
		return newEntity().findOrFail( arguments.id );
	}

}
