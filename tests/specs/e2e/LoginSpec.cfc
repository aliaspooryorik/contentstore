component extends="cbPlaywright.models.ColdBoxPlaywrightTestCase" {

	function run(){
		describe( "home page", () => {
			it( "can visit the home page", () => {
				var browser = launchInteractiveBrowser( variables.playwright.chromium() );
				var page = browser.newPage();
				navigate( page, route( "/" ) );
				waitForLoadState( page );


				expect( page.title() ).toBe( "Login" );

				pause();


				getByLabel( page, "Username:" ).click();
				getByLabel( page, "Username:" ).fill( "john.whish@gmail.com" );
				getByLabel( page, "Username:" ).press( "Tab" );
				getByLabel( page, "Password:" ).fill( "ashaksdslkdfjslkdfj" );
				getByRole( page, "button", { name : "Sign In" } ).click();
				getByLabel( page, "Username:" ).click();
				getByLabel( page, "Username:" ).fill( "john.whish@gmail.cp" );
				getByLabel( page, "Username:" ).press( "Tab" );
				getByLabel( page, "Password:" ).press( "Shift+Tab" );
				getByLabel( page, "Username:" ).press( "ArrowRight" );
				getByLabel( page, "Username:" ).fill( "john.whish@gmail.com" );
				getByLabel( page, "Username:" ).press( "Tab" );
				getByLabel( page, "Password:" ).fill( "abc" );
				getByRole( page, "button", { name : "Log In" } ).click();
				getByRole( page, "link", { name : "Users" } ).click();
				// locateElement( page, "##navbarSupportedContent [href$='/users']" ).click();

				getByRole( page, "link", { name : "Log Out" } ).click();
				getByRole( page, "link", { name : "Home" } ).click();


				var email = locateElement( page, "##email" );
				fill( email, "playwright" );
			} );
		} );
	}

}
