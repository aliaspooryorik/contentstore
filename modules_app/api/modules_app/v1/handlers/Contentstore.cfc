/**
 * The main module handler
 */
component extends="coldbox.system.RestHandler" {

	/**
	 * Module EntryPoint
	 */
	void function index( event, rc, prc ){
		event.getResponse().setData( "Welcome to /api/v1/contentstore/" );
	}

	void function show( event, rc, prc ){
		var contentForSlug = getInstance( "Content" )
			.asMemento()
			.where( "slug", "=", rc.slug )
			.where( "active", "=", 1 )
			.first();

		if ( isNull( contentForSlug ) ) {
			arguments.event
				.getResponse()
				.setError( true )
				.addMessage( "Slug '#rc.slug#' could not be found" )
				.setStatusCode( arguments.event.STATUS.NOT_FOUND )
				.setStatusText( "Not Found" );
		} else {
			arguments.event.getResponse().setData( contentForSlug );
		}
	}

	void function preHandler( event, rc, prc ){
		arguments.event
			.getResponse()
			.addHeader( "Access-Control-Allow-Origin", "*" )
			.addHeader( "Access-Control-Allow-Headers", "X-Requested-With, Content-Type, x-api-token" );
	}

}
