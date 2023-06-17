/**
 * I handle login
 **/
component extends="coldbox.system.EventHandler" {

	/**
	 * login form
	 **/
	function new( event, rc, prc ){
		prc.pageTitle = "Login";
		event.setView( "sessions/new" );
	}

	/**
	 * do login
	 **/
	function create( event, rc, prc ){
		var result = validateModel(
			target      = rc,
			constraints = {
				"username" : { "required" : true },
				"password" : { "required" : true }
			}
		);

		if ( result.hasErrors() ) {
			cbMessageBox().error( result.getAllErrors() );
			back();
			return;
		}

		try {
			auth().authenticate( rc.username, rc.password );
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
