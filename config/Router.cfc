component {

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );
		setExtensionDetection( false );

		route( "/login" ).withHandler( "sessions" ).toAction( { "GET" : "new", "POST" : "create" } );
		route( "/logout", "sessions.delete" );

		resources( resource = "users", parameterName = "id" );
		resources( resource = "contents", parameterName = "id" );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
