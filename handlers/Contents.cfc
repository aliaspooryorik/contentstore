component extends="coldbox.system.EventHandler" secured {

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

	function delete( event, rc, prc ){
		var content = getInstance( "Content" ).findOrFail( rc.contentId );
		content.delete();
		relocate( "contents" );
	}

	function edit( event, rc, prc ){
		prc.content = getInstance( "Content" ).findOrFail( rc.contentId );
	}

	function new( event, rc, prc ){
		prc.content = getInstance( "Content" );
	}

	function update( event, rc, prc ){
		var content = getInstance( "Content" ).findOrFail( rc.contentId );
		content.update( {
			slug : rc.slug,
			title : rc.title,
			content : rc.content,
			active : rc.keyExists( "active" )
		} );
		relocate( "contents" );
	}

	function show( event, rc, prc ){
		prc.content = getInstance( "Content" ).findOrFail( rc.contentId );
	}

}

