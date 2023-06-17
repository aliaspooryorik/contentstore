component {

	void function up( schema, query ){
		schema.create( "tblcontents", function(table) {
			table
				.guid( "content_id" )
				.default( "'UUID()'" )
				.primaryKey();
			table.string( "slug", 500 ).unique();
			table.string( "title", 500 );
			table.longtext( "content" );
			table.boolean( "active" ).default( false );
			table.timestamps();
		} );
	}

	void function down( schema, query ){
		schema.drop( "tblcontents" );
	}

}
