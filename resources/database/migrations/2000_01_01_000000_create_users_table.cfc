component {

	void function up( schema, query ){
		schema.create( "tblusers", function( table ){
			table.increments( "user_id" );
			table.string( "username" ).unique();
			table.string( "email" ).unique();
			table.string( "firstname" );
			table.string( "lastname" );
			table.string( "password" );
			table.boolean( "active" );
			table.timestamps();
		} );
	}

	void function down( schema, query ){
		schema.drop( "tblusers" );
	}

}
