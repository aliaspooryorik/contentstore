/**
 * The main module handler
 */
component extends="coldbox.system.RestHandler" {

	/**
	 * Module EntryPoint
	 */
	function index( event, rc, prc ){
		event.getResponse().setDataWithPagination(  getInstance( "Content" ).asMemento().paginate() );
	}

	function view( event, rc, prc ){
		event.getResponse().setData(  getInstance( "Content" ).asMemento().where( "slug", rc.slug ).first() );
	}

}
