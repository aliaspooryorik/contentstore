component {

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );

		route( "/login" ).withHandler( "sessions" ).toAction( { "GET" : "new", "POST" : "create" } );

		route( "/logout", "sessions.delete" );

		resources( resource = "registrations", only = [ "new", "create" ] );


		get( "/contents/new", "Contents.new" );
		get( "/contents/:contentId", "Contents.show" );
		route( "/contents" ).withHandler( "Contents" ).toAction( { 
			"GET"  : "index", 
			"POST" : "create" 
		} );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}
