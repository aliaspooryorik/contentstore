component extends="cbPlaywright.models.ColdBoxPlaywrightTestCase" {

	function run(){
		describe( "Login Tests", () => {
			it( "should redirect to login for unauthorised user", () => {
				var browser = launchInteractiveBrowser( variables.playwright.chromium() );
				var page = browser.newPage();
				navigate( page, route( "/contents" ) );

				waitForLoadState( page );

				expect( page.title() ).toBe( "Login" );
			} );

			it( "should not allow an invalid login", () => {
				var browser = launchInteractiveBrowser( variables.playwright.chromium() );
				var page = browser.newPage();
				navigate( page, route( "/" ) );
				waitForLoadState( page );

				expect( page.title() ).toBe( "Login" );
				expect( locateElement( page, "Invalid Credentials" ) ).toHaveLength( 0 );

				getByLabel( page, "Username:" ).click();
				getByLabel( page, "Username:" ).fill( "invalid" );
				getByLabel( page, "Username:" ).press( "Tab" );
				getByLabel( page, "Password:" ).fill( "login" );
				getByLabel( page, "Password:" ).fill( "bad password" );
				getByRole( page, "button", { name : "Sign In" } ).click();

				expect( locateElement( page, "text=Invalid Credentials" ).count() ).toBe( 1 );
				expect( locateElement( page, "text=NOT ON PAGE" ).count() ).toBe( 0 );
			} );

			it( "should  allow an valid login", () => {
				var browser = launchInteractiveBrowser( variables.playwright.chromium() );
				var page = browser.newPage();
				navigate( page, route( "/" ) );
				waitForLoadState( page );

				expect( page.title() ).toBe( "Login" );

				getByLabel( page, "Username:" ).click();
				getByLabel( page, "Username:" ).fill( "testuseraccount" );
				getByLabel( page, "Username:" ).press( "Tab" );
				getByLabel( page, "Password:" ).fill( "login" );
				getByLabel( page, "Password:" ).fill( "Password123!" );
				getByRole( page, "button", { name : "Sign In" } ).click();

				expect( locateElement( page, "text=Invalid Credentials" ).count() ).toBe( 0 );
				expect( locateElement( page, "text=Hi Forename Surname!" ).count() ).toBe( 1 );

				getByRole( page, "link", { name : "Log Out" } ).click();
				expect( page.title() ).toBe( "Login" );
			} );
		} );
	}

}
