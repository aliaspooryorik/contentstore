component extends="coldbox.system.EventHandler" secured {

	/**
	 * list
	 */
	function index( event, rc, prc ){
		prc.contents = getInstance( "Content" ).get();
		event.setView( "contents/index" );
	}

	/**
	 * edit form
	 */
	function edit( event, rc, prc ) {
		event.setView( "contents/edit" );
	}

	/**
	 * new form
	 */
	function new( event, rc, prc ){
		prc.content = getInstance( "Content" );
		event.setView( "contents/new" );
	}

	/**
	 * do create
	 */
	function create( event, rc, prc ) allowedMethods="POST" {
		var content = getInstance( "Content" ).create( {
			slug : rc.slug,
			title : rc.title,
			content : rc.content,
			active : rc.keyExists( "active" )
		} );
		relocate( "contents" );
	}

	function show( event, rc, prc ){
		event.setView( "contents/show" );
	}


	/**
	 * delete
	 */
	function delete( event, rc, prc ) allowedMethods="DELETE" {
		prc.content.delete();
		relocate( "contents" );
	}

	/**
	 * do update
	 */
	function update( event, rc, prc ) allowedMethods="PUT" {
		prc.content.populate( {
			slug : rc.slug,
			title : rc.title,
			content : rc.content,
			active : rc.keyExists( "active" )
		} );
		relocate( "contents" );
	}

	/**
	 * interception handlers
	 */
	function preHandler( event, rc, prc ){
		if ( structKeyExists( rc, "contentId" ) ) {
			try {
				prc.content = getInstance( "Content" ).findOrFail( rc.contentId );
			} catch ( EntityNotFound err ) {
				cbMessageBox().error( err.message );
				relocate( "contents" );
			}
		}
	}

}

