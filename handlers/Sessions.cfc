/**
 * I handle login
 **/
component extends="coldbox.system.EventHandler" {

	/**
	 * login form
	 **/
	function new( event, rc, prc ){
		event.setView( "sessions/new" );
	}

	/**
	 * do login
	 **/
	function create( event, rc, prc ) {
		var result = validateModel(
			target = rc,
			constraints = { "email" : { "required" : true, "type" : "email" }, "password" : { "required" : true } }
		);

		if ( result.hasErrors() ) {
			cbMessageBox().error( result.getAllErrors() );
			back();
			return;
		}

		try{
			auth().authenticate( rc.email, rc.password );
			relocate( uri = "/" );
		} catch ( InvalidCredentials e ) {
			cbMessageBox().error( "Invalid Credentials" );
			back();
		}
	}

	/**
	 * do logout
	 **/
	function delete( event, rc, prc ){
		auth().logout();
		relocate( uri = "/" );
	}

}
