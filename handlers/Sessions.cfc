/**
 * I handle login
 **/
component extends="coldbox.system.EventHandler" {

	property name="flash" inject="coldbox:flash";

	/**
	 * login form
	 **/
	function new( event, rc, prc ){
		param rc._securedUrl = flash.get( "_securedUrl", "/" );
		flash.put( "_securedUrl", rc._securedUrl );
		param prc.errors = flash.get( "login_form_errors", {} );
		event.setView( "sessions/new" );
	}

	/**
	 * authenticate login
	 **/
	function create( event, rc, prc ) {
		flash.keep( "_securedUrl" );

		var result = validateModel(
			target = rc,
			constraints = { "email" : { "required" : true, "type" : "email" }, "password" : { "required" : true } }
		);

		if ( result.hasErrors() ) {
			flash.put( "login_form_errors", result.getAllErrorsAsStruct() );
			back();
			return;
		}

		try{
			auth().authenticate( rc.email, rc.password );
			relocate( uri = flash.get( "_securedUrl", "/" ) );
		} catch ( InvalidCredentials e ) {
			flash.put( "login_form_errors", { "login" : "Invalid Credentials" } );
			back();
		}
	}

	/**
	 * logout
	 **/
	function delete( event, rc, prc ){
		auth().logout();
		relocate( uri = "/" );
	}

}
