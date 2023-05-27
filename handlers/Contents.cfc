component extends="coldbox.system.EventHandler"{

	function index( event, rc, prc ){
		prc.contents = getInstance( "Content" ).get();
	}


	function create( event, rc, prc ){
		var content = getInstance( "Content" ).create( {
			slug : rc.slug,
			title : rc.title,
			content : rc.content,
			active : rc.keyExists( "active" )
		} );
		relocate( "contents" );
	}

	function new( event, rc, prc ){
		
	}

	function show( event, rc, prc ){
		prc.content = getInstance( "Content" ).findOrFail( rc.contentId );
	}

}

