component {

	void function run( qb, mockdata ){
		qb.table( "tblusers" )
			.insert( {
				"username" : "testuseraccount",
				"email" : "test@useraccount.test",
				"firstname" : "Forename",
				"lastname" : "Surname",
				"password" : "$2a$12$Lsdc4.gK3xPpbcN01rOW4.R18EQXqhNKb/EstymUbPH6tNWD9SxCm", // Password123!
				"active" : 1
			} );
	}

}
