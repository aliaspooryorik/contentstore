component extends="cbPlaywright.models.ColdBoxPlaywrightTestCase" {

	function beforeAll(){
		super.beforeAll();
		variables.browser = launchInteractiveBrowser( variables.playwright.chromium() );
	}

	function afterAll(){
		super.afterAll();
	}

	function run(){
		describe( "Contents Tests", function() {
			beforeEach( function() {
				variables.context = variables.browser.newContext();
				variables.page = new PageDecorator( variables.context.newPage() );
				doLogin();
			} );
			afterEach( function() {
				variables.context.close();
			} );

			it( "should create new content", function() {
				var slugTitle = "myslug-#getTickCount()#";
				var pageTitle = "My Title #getTickCount()#";
				page.navigate( route( "/contents" ) );

				expect( page.title() ).toBe( "Contents" );

				page.getByRole( "link", { name : "Contents", exact : true } ).click();
				page.getByRole( "link", { name : "Create New Content" } ).click();
				page.getByLabel( "Slug" ).click();
				page.getByLabel( "Slug" ).fill( slugTitle );
				page.getByLabel( "Slug" ).press( "Tab" );
				page.getByLabel( "Title" ).fill( pageTitle );
				page.getByLabel( "Title" ).press( "Tab" );
				page.getByLabel( "Content" ).fill( "My Content" );
				page.getByLabel( "Active" ).check();
				page.getByRole( "button", { name : "Submit" } ).click();
				page.getByLabel( "Slug" ).click();
				page.getByLabel( "Slug" ).press( "Meta+ArrowLeft" );
				page.getByLabel( "Slug" ).fill( "en/#slugTitle#" );
				page.getByRole( "button", { name : "Submit" } ).click();

				// page.pause();
				expect( page.getByText( "New Content '#pageTitle#' created" ).count() ).toBe( 1 );
			} );
		} );
	}

	private function doLogin(){
		page.navigate( route( "/" ) );
		page.getByLabel( "Username:" ).fill( "testuseraccount" );
		page.getByLabel( "Password:" ).fill( "Password123!" );
		page.getByRole( "button", { name : "Sign In" } ).click();
	}

}
