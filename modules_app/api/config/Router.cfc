/**
 * Module Router
 * https://coldbox.ortusbooks.com/the-basics/routing/routing-dsl
 */
component{

	function configure(){

		route( "/", "Home.index" );
		route( "/:slug", "Home.view" );
		//resources( resource = "api", parameterName = "slug", only = [ "view" ] );

	}

}
