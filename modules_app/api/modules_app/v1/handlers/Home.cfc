/**
 * The main module handler
 */
component extends="coldbox.system.RestHandler" {

	/**
	 * Module EntryPoint
	 */
	void function index( event, rc, prc ){
		event.getResponse().setData( "Welcome to /api/v1/" );
	}

}
