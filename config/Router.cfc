component {

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );
		setExtensionDetection( false );

		route( "/login" ).withHandler( "sessions" ).toAction( { "GET" : "new", "POST" : "create" } );
		route( "/logout", "sessions.delete" );

		resources( resource = "users", parameterName = "userId" );
		resources( resource = "contents", parameterName = "contentId" );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
