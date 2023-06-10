component extends="coldbox.system.EventHandler" {

	/**
	 * list
	 */
	function index( event, rc, prc ){
		prc.users = getInstance( "User" ).get();
		event.setView( "users/index" );
	}


	/**
	 * edit form
	 */
	function edit( event, rc, prc ){
	}

	/**
	 * new form
	 */
	function new( event, rc, prc ){
		prc.user = getInstance( "User" );
		event.paramPrivateValue( "errors", {} );
		event.setView( "users/new" );
	}


	/**
	 * process new user form
	 **/
	function create( event, rc, prc ){
		prc.User = getInstance( "User" ).populate( { "email" : rc.email, "password" : rc.password } );
		var result = validateModel( target = prc.User );

		if ( result.hasErrors() ) {
			flash.put( "registration_form_errors", result.getAllErrorsAsStruct() );
			back();
			return;
		}

		var user = getInstance( "User" ).create( { "email" : rc.email, "password" : rc.password } );

		relocate( uri = flash.get( "_securedUrl", "/" ) );
	}

}
