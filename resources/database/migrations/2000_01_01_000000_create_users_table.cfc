component {

	function up( schema, query ){
		schema.create( "tblusers", function( table ) {
			table.increments( "user_id" );
			table.string( "email" ).unique();
			table.string( "password" );
			table.timestamps();
		} );
	}

	function down( schema, query ){
		schema.drop( "tblusers" );
	}

}
