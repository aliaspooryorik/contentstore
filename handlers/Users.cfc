component extends="coldbox.system.EventHandler" secured {

	/**
	 * list
	 */
	function index( event, rc, prc ){
		prc.users = getInstance( "User" ).orderBy( "username" ).get();
		prc.pageTitle = "Users";
		event.setView( "users/index" );
	}

	/**
	 * edit form
	 */
	function edit( event, rc, prc ){
		if ( !structKeyExists( rc, "UserViewModel" ) ) {
			// UserViewModel could be passed back when validation fails so we can populate the form
			var UserEntity = getInstance( "User" ).findOrFail( rc.id );
			rc.UserViewModel = populate( model = "UserViewModel", memento = UserEntity.getMemento() );
		}
		event.paramValue( "validationerrors", {} );
		prc.pageTitle = "Edit User";
		event.setView( "users/edit" );
	}

	/**
	 * do update
	 */
	function update( event, rc, prc ){
		var UserViewModel = populate( model = "UserViewModel", memento = rc );
		var result = validateModel( target = UserViewModel, constraints = UserViewModel.contextConstraints( "update" ) );

		if ( result.hasErrors() ) {
			flash.put( "UserViewModel", UserViewModel );
			flash.put( "validationerrors", result.getAllErrorsAsStruct() );
			cbMessageBox().error( "Please review the #result.getErrorCount()# errors" );
			return relocate( "users.#rc.id#.edit" );
		}
		getInstance( "User" ).findOrFail( rc.id ).update( UserViewModel.getMemento( profile = "persistance" ) );

		cbMessageBox().success( "User '#UserViewModel.getUsername()#' updated" );

		relocate( "users" );
	}

	/**
	 * new form
	 */
	function new( event, rc, prc ){
		// UserViewModel could be passed back when validation fails so we can populate the form
		event.paramValue( "UserViewModel", getInstance( "UserViewModel" ) );
		event.paramValue( "validationerrors", {} );
		prc.pageTitle = "New User";
		event.setView( "users/new" );
	}

	/**
	 * do create
	 */
	function create( event, rc, prc ){
		var UserViewModel = getInstance( "UserViewModel" );

		populate( model = UserViewModel, memento = rc );
		var result = validateModel( target = UserViewModel, constraints = UserViewModel.contextConstraints( "create" ) );
		if ( result.hasErrors() ) {
			flash.put( "UserViewModel", UserViewModel );
			flash.put( "validationerrors", result.getAllErrorsAsStruct() );
			cbMessageBox().error( "Please review the #result.getErrorCount()# errors" );
			return relocate( "users.new" );
		}

		getInstance( "entities.User" ).create( UserViewModel.getMemento( profile = "persistance" ) );

		cbMessageBox().success( "New user '#UserViewModel.getUsername()#' created" );
		relocate( "users" );
	}

	/**
	 * do delete
	 */
	function delete( event, rc, prc ){
		getInstance( "entities.User" ).findOrFail( rc.id ).delete();
		cbMessageBox().success( "User deleted" );
		relocate( "users" );
	}

	/**
	 * view
	 */
	function show( event, rc, prc ){
		prc.User = getInstance( "User" ).findOrFail( rc.id );
		prc.pageTitle = prc.User.getUsername();
		event.setView( "users/show" );
	}

}
