component extends="coldbox.system.EventHandler" secured {

	/**
	 * list
	 */
	function index( event, rc, prc ){
		prc.Contents = getInstance( "Content" ).orderBy( "slug" ).get();
		prc.pageTitle = "Contents";
		event.setView( "contents/index" );
	}

	/**
	 * edit form
	 */
	function edit( event, rc, prc ){
		if ( !structKeyExists( rc, "ContentViewModel" ) ) {
			// ContentViewModel could be passed back when validation fails so we can populate the form
			var ContentEntity = getInstance( "Content" ).findOrFail( rc.id );
			rc.ContentViewModel = populate( model = "ContentViewModel", memento = ContentEntity.getMemento() );
		}
		event.paramValue( "validationerrors", {} );
		prc.pageTitle = "Edit Content";
		event.setView( "contents/edit" );
	}

	/**
	 * do update
	 */
	function update( event, rc, prc ){
		var ContentViewModel = populate( model = "ContentViewModel", memento = rc );
		var result = validateModel(
			target = ContentViewModel,
			constraints = ContentViewModel.contextConstraints( "update" )
		);

		if ( result.hasErrors() ) {
			cbMessageBox().error( "Please review the #result.getErrorCount()# errors" );
			back(
				persistStruct = {
					ContentViewModel : ContentViewModel,
					validationerrors : result.getAllErrorsAsStruct()
				}
			);
			return;
		}
		getInstance( "Content" ).findOrFail( rc.id ).update( ContentViewModel.getMemento( profile = "persistance" ) );

		cbMessageBox().success( "Contents for '#ContentViewModel.getTitle()#' updated" );

		relocate( "Contents" );
	}

	/**
	 * new form
	 */
	function new( event, rc, prc ){
		// ContentViewModel could be passed back when validation fails so we can populate the form
		event.paramValue( "ContentViewModel", getInstance( "ContentViewModel" ) );
		event.paramValue( "validationerrors", {} );
		prc.pageTitle = "New Content";
		event.setView( "contents/new" );
	}

	/**
	 * do create
	 **/
	function create( event, rc, prc ){
		var ContentViewModel = getInstance( "ContentViewModel" );

		populate( model = ContentViewModel, memento = rc );
		var result = validateModel(
			target = ContentViewModel,
			constraints = ContentViewModel.contextConstraints( "create" )
		);

		if ( result.hasErrors() ) {
			cbMessageBox().error( "Please review the #result.getErrorCount()# errors" );
			back(
				persistStruct = {
					ContentViewModel : ContentViewModel,
					validationerrors : result.getAllErrorsAsStruct()
				}
			);
			return;
		}

		getInstance( "entities.Content" ).create( ContentViewModel.getMemento( profile = "persistance" ) );

		cbMessageBox().success( "New Content '#ContentViewModel.getTitle()#' created" );
		relocate( "Contents" );
	}

	function show( event, rc, prc ){
		prc.Content = getInstance( "Content" ).findOrFail( rc.id );
		prc.pageTitle = "Content Details";
		event.setView( "contents/show" );
	}


	function preHandler( event, rc, prc ){
		writeDump( var = "preHandler", top = 2 )
		writeDump( var = rc, top = 2 )
		writeDump( var = prc, top = 2 )
		abort;
	}

}
