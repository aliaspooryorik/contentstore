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
	property name="username";
	property name="firstname";
	property name="lastname";
	property name="password" setter=false;
	property name="active" casts="BooleanCast@quick";

	this.memento = { neverInclude : [ "password" ] };

	public User function setPassword( required string password ){
		if ( arguments.password != "" ) { 
			assignAttribute( "password", bcrypt.hashPassword( arguments.password ) );
		}
		return this;
	}

	public string function getFullname(){
		return "#retrieveAttribute( "firstname" )# #retrieveAttribute( "lastname" )#";
	}

	public string function getInitials(){
		return "#left( retrieveAttribute( "firstname" ), 1 )##left( retrieveAttribute( "lastname" ), 1 )#";
	}


	/**
	 * authentication methods
	 */
	public boolean function hasPermission( required string permission ){
		return true;
	}

	public boolean function isValidCredentials( required string username, required string password ){
		var user = newEntity()
			.where( "username", arguments.username )
			.where( "active", 1 )
			.first();
		if ( isNull( user ) ) {
			return false;
		}
		return bcrypt.checkPassword( arguments.password, user.getPassword() );
	}

	public User function retrieveUserByUsername( required string username ){
		return newEntity().where( "username", arguments.username ).firstOrFail();
	}

	public User function retrieveUserById( required numeric id ){
		return newEntity().findOrFail( arguments.id );
	}

}
