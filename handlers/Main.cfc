component extends="coldbox.system.EventHandler" secured {

	/**
	 * Default page
	 **/
	function index( event, rc, prc ){
		event.setView( "main/index" );
	}

	function invalidEvent( event, rc, prc ){
		event
			.setView( "main/invalidevent" )
			.setHTTPHeader( arguments.event.STATUS.NOT_FOUND, "Not Found" )
			.noLayout();
	}

	/************************************** IMPLICIT ACTIONS *********************************************/

	function onAppInit( event, rc, prc ){
	}

	function onRequestStart( event, rc, prc ){
	}

	function onRequestEnd( event, rc, prc ){
	}

	function onSessionStart( event, rc, prc ){
	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

}
