component {

	void function run( qb, mockdata ){
		qb.table( "tblcontents" )
			.insert( {
                content_id: "718F1DB4-766A-44A0-A8D791AADA48C001",
				slug: "en/my-test-slug", 
                title: "My Test Slug", 
                content: "My Test Slug Content", 
                active: 1
            } );
    }

}
