component extends="tests.resources.BasePlaywrightSpec" {

	this.interactiveBrowser = true;

	function run(){
		describe( "Login Tests", function() {
			beforeEach( function() {
				setup();
			} );
			afterEach( function() {
				teardown();
			} );
			it( "should redirect to login for unauthorised user", () => {
				page.navigate( route( "/contents" ) );
				waitForLoadState( page );
				expect( page.title() ).toBe( "Login" );
			} );

			it( "should not allow an invalid login", () => {
				page.navigate( route( "/" ) );
				waitForLoadState( page );

				expect( page.title() ).toBe( "Login" );
				expect( locateElement( page, "Invalid Credentials" ) ).toHaveLength( 0 );

				page.getByLabel( "Username:" ).click();
				page.getByLabel( "Username:" ).fill( "invalid" );
				page.getByLabel( "Username:" ).press( "Tab" );
				page.getByLabel( "Password:" ).fill( "login" );
				page.getByLabel( "Password:" ).fill( "bad password" );
				page.getByRole( "button", { name : "Sign In" } ).click();

				expect( locateElement( page, "text=Invalid Credentials" ).count() ).toBe( 1 );
				expect( locateElement( page, "text=NOT ON PAGE" ).count() ).toBe( 0 );
			} );

			it( "should  allow an valid login", () => {
				page.navigate( route( "/" ) );
				waitForLoadState( page );

				expect( page.title() ).toBe( "Login" );

				page.getByLabel( "Username:" ).click();
				page.getByLabel( "Username:" ).fill( "testuseraccount" );
				page.getByLabel( "Username:" ).press( "Tab" );
				page.getByLabel( "Password:" ).fill( "login" );
				page.getByLabel( "Password:" ).fill( "Password123!" );
				page.getByRole( "button", { name : "Sign In" } ).click();

				page.getByRole( "link", { name : "Log Out" } ).click();
				expect( page.title() ).toBe( "Login" );
			} );
		} );
	}

}
