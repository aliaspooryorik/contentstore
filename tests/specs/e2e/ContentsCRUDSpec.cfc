component extends="tests.resources.BasePlaywrightSpec" {

	this.interactiveBrowser = false;

	function run(){
		describe( "Contents Tests", function() {
			beforeEach( function() {
				setup();
			} );
			afterEach( function() {
				teardown();
			} );

			it( "should support crud for content", function() {
				// create
				var slugTitle = "myslug-#getTickCount()#";
				var pageTitle = "My Title #getTickCount()#";

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

				expect( page.getByText( "New Content '#pageTitle#' created" ).count() ).toBe( 1 );

				// edit
				page.getByTestId( "row-1-edit-link" ).click();
				page.getByLabel( "title" ).fill( "My Updated Title" );
				page.getByRole( "button", { name: "Submit" } ).click();
				expect( page.getByText( "Contents for 'My Updated Title' updated" ).count() ).toBe( 1 );
				
				// delete
				expect( page.title() ).toBe( "Contents" );

				//page.locator( "table tr:first-child td:nth-child(4) a" ).click();
				page.getByTestId( "row-1-view-link" ).click();
				page.getByRole( "button", { name: "Delete" } ).click();

				expect( page.getByText( "Content deleted" ).count() ).toBe( 1 );

			} );

		} );
	}

	private function setup(){
		super.setup();
		page.navigate( route( "/" ) );
		page.getByLabel( "Username:" ).fill( "testuseraccount" );
		page.getByLabel( "Password:" ).fill( "Password123!" );
		page.getByRole( "button", { name : "Sign In" } ).click();
		page.navigate( route( "/contents" ) );
	}

}
