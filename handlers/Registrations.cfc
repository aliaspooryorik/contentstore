component extends="coldbox.system.EventHandler" secured {

		
	/**
	 * list
	 */
	function index( event, rc, prc ){
		prc.contents = getInstance( "Content" ).get();
	}


	/**
	 * edit form
	 */
	function edit( event, rc, prc ) {
	}

	/**
	 * new form
	 */
	function new( event, rc, prc ){
		prc.user = getInstance( "User" );
	}



	/**
	 * new user form
	 **/
	function new( event, rc, prc ){
		param prc.errors = flash.get( "registration_form_errors", {} );
		event.setView( "registrations/new" );
	}

	/**
	 * process new user form
	 **/
	function create( event, rc, prc ){
		var result = validateModel(
			target = rc,
			constraints = {
				"email" : {
					"required" : true,
					"type" : "email",
					"uniqueInDatabase" : { "table" : "tblusers", "column" : "email" }
				},
				"password" : { "required" : true },
				"passwordConfirmation" : { "required" : true, "sameAs" : "password" }
			}
		);

		if ( result.hasErrors() ) {
			flash.put( "registration_form_errors", result.getAllErrorsAsStruct() );
			back();
			return;
		}

		var user = getInstance( "User" ).create( { "email" : rc.email, "password" : rc.password } );

		relocate( uri = flash.get( "_securedUrl", "/" ) );
	}

}
