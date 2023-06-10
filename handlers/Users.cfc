component extends="coldbox.system.EventHandler" secured {

	/**
	 * list
	 */
	function index( event, rc, prc ){
		prc.users = getInstance( "Content" ).get();
		event.setView( "users/index" );
	}


	/**
	 * edit form
	 */
	function edit( event, rc, prc ){
		event.setView( "users/edit" );
	}

	/**
	 * new form
	 */
	function new( event, rc, prc ){
		prc.user = getInstance( "User" );
		event.paramValue( "validationerrors", {} );
		event.setView( "users/new" );
	}

	/**
	 * do create
	 **/
	function create( event, rc, prc ){
		var user = getInstance( "User" );
		populate(
			model   = user,
			memento = {
				"email"                : rc.email,
				"password"             : rc.password,
				"passwordConfirmation" : rc.passwordConfirmation
			}
		);
		var result = validateModel( target = user );

		if ( result.hasErrors() ) {
			cbMessageBox().error( "Please review the #result.getErrorCount()# errors" );
			back( persistStruct = { validationerrors : result.getAllErrorsAsStruct() } );
			return;
		}

		var user = getInstance( "User" ).create( { "email" : rc.email, "password" : rc.password } );

		relocate( uri = flash.get( "_securedUrl", "/" ) );
	}

}
