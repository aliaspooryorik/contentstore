component {

	function up( schema, query ){
		schema.create( "tblcontents", function( table ) {
			table.guid( "content_id" ).default( "'UUID()'" ).primaryKey();
			table.string( "slug" ).unique();
			table.string( "title" );
			table.string( "content" );
			table.boolean( "active" ).default( false );
			table.timestamps();
		} );
	}

	function down( schema, query ){
		schema.drop( "tblcontents" );
	}

}
