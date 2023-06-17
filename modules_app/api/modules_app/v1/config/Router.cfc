/**
 * Module Router
 * https://coldbox.ortusbooks.com/the-basics/routing/routing-dsl
 */
component{

	function configure(){

		route( "/", "Home.index" );
		route( "/contentstore/:slug-regex:([a-zA-Z]+.+)" ).to( "contentstore.show" );

	}

}
