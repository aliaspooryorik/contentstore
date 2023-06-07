component extends="coldbox.system.EventHandler" secured {

	/**
	 * list contents
	 */
	function index( event, rc, prc ){
		prc.contents = getInstance( "Content" ).get();
	}

	/**
	 * load existing content into form to edit
	 */
	function edit( event, rc, prc ) {
	}

	/**
	 * new content form
	 */
	function new( event, rc, prc ){
		prc.content = getInstance( "Content" );
	}

	/**
	 * create content
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
	}


	/**
	 * delete content
	 */
	function delete( event, rc, prc ) allowedMethods="DELETE" {
		prc.content.delete();
		relocate( "contents" );
	}

	/**
	 * update existing content
	 */
	function update( event, rc, prc ) allowedMethods="PUT" {
		prc.content.update( {
			slug : rc.slug,
			title : rc.title,
			content : rc.content,
			active : rc.keyExists( "active" )
		} );
		relocate( "contents" );
	}


	/**
	 * Action used when the framework detects and Invalid HTTP method for the action
	 *
	 * @event          The request context
	 * @rc             The rc reference
	 * @prc            The prc reference
	 * @faultAction    The action that was secured
	 * @eventArguments The original event arguments
	 */
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
		// Log it
		log.warn(
			"InvalidHTTPMethod Execution of (#arguments.faultAction#): #arguments.event.getHTTPMethod()#",
			getHTTPRequestData( false )
		);
		relocate( "contents" );
	}


	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		if ( structKeyExists( rc, "contentId" ) ) {
			try {
				prc.content = getInstance( "Content" ).findOrFail( rc.contentId );
			} catch ( EntityNotFound err ) {
				cbMessageBox().error( err.message );
				relocate( "contents" );
			}
		}
		return arguments.targetAction( argumentCollection=arguments );
	}

}

