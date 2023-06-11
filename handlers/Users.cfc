component extends="coldbox.system.EventHandler" secured {

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
		if ( !structKeyExists( rc, "UserViewModel" ) ) {
			// UserViewModel could be passed back when validation fails so we can populate the form
			var UserEntity   = getInstance( "User" ).findOrFail( rc.id );
			rc.UserViewModel = populate( model = "UserViewModel", memento = UserEntity.getMemento() );
		}
		event.paramValue( "validationerrors", {} );
		event.setView( "users/edit" );
	}

	/**
	 * do update
	 */
	function update( event, rc, prc ){
		var UserViewModel = populate( model = "UserViewModel", memento = rc );
		var result        = validateModel(
			target      = UserViewModel,
			constraints = UserViewModel.contextConstraints( "update" )
		);

		if ( result.hasErrors() ) {
			cbMessageBox().error( "Please review the #result.getErrorCount()# errors" );
			back(
				persistStruct = {
					UserViewModel    : UserViewModel,
					validationerrors : result.getAllErrorsAsStruct()
				}
			);
			return;
		}
		getInstance( "User" ).findOrFail( rc.id ).update( UserViewModel.getMemento( profile = "persistance" ) );

		relocate( "users" );
	}

	/**
	 * new form
	 */
	function new( event, rc, prc ){
		// UserViewModel could be passed back when validation fails so we can populate the form
		event.paramValue( "UserViewModel", getInstance( "UserViewModel" ) );
		event.paramValue( "validationerrors", {} );
		event.setView( "users/new" );
	}

	/**
	 * do create
	 **/
	function create( event, rc, prc ){
		var UserViewModel = getInstance( "UserViewModel" );

		populate( model = UserViewModel, memento = rc );
		var result = validateModel(
			target      = UserViewModel,
			constraints = UserViewModel.contextConstraints( "create" )
		);

		if ( result.hasErrors() ) {
			cbMessageBox().error( "Please review the #result.getErrorCount()# errors" );
			back(
				persistStruct = {
					UserViewModel    : UserViewModel,
					validationerrors : result.getAllErrorsAsStruct()
				}
			);
			return;
		}

		getInstance( "entities.User" ).create( UserViewModel.getMemento( profile = "persistance" ) );

		relocate( "users" );
	}

	function show( event, rc, prc ){
		prc.User = getInstance( "User" ).findOrFail( rc.id );
		event.setView( "users/show" );
	}

}
