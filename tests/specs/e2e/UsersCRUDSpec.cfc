component extends="tests.resources.BasePlaywrightSpec" {

	this.interactiveBrowser = false;

	function run(){
		describe( "Users Tests", function() {
			beforeEach( function() {
				setup();
			} );
			afterEach( function() {
				teardown();
			} );

			it( "should support crud for users", function() {
				// create
				expect( page.title() ).toBe( "Users" );

				var newUsername = "username #getTickCount()#";
				var newEmail = "#getTickCount()#@email.test";

				page.getByRole("LINK", { name: "Create New User" } ).click();
				page.getByLabel("Username:").click();
				page.getByLabel("Username:").fill(newUsername);
				page.getByLabel("Username:").press("Tab");
				page.getByLabel("First Name:").fill("New");
				page.getByLabel("First Name:").press("Tab");
				page.getByLabel("Last Name:").fill("User");
				page.getByLabel("Last Name:").press("Tab");
				page.getByLabel("Email Address:").fill(newEmail);
				page.getByLabel("Email Address:").press("Tab");
				page.getByLabel("Password:").fill("abc123");
				page.getByLabel("Password:").press("Tab");
				page.getByLabel("Password Confirmation:").fill("abc");
				page.getByLabel("Active").check();
				page.getByLabel("Active").uncheck();
				page.getByLabel("Active").check();
				page.getByRole("BUTTON", { name: "Submit" }).click();
				page.getByLabel("Password:").click();
				page.getByLabel("Password:").fill("Password123!");
				page.getByLabel("Password:").press("Tab");
				page.getByLabel("Password Confirmation:").fill("Password123!");
				page.getByRole("BUTTON", { name: "Submit" }).click();

				expect( page.getByText( "User '#newUsername#' created" ).count() ).toBe( 1 );

				// edit
				page.getByTestId( "row-1-edit-link" ).click();

				page.getByLabel("Username:").click();
				page.getByLabel("Username:").fill("#newUsername# edited");
				page.getByRole("BUTTON", { name: "Submit" }).click();
				expect( page.getByText( "User '#newUsername# edited' updated" ).count() ).toBe( 1 );
				
				// delete
				page.getByTestId( "row-1-view-link" ).click();
				page.getByRole("BUTTON", { name: "Delete" }).click();
				expect( page.getByText( "User deleted" ).count() ).toBe( 1 );

			} );

		} );
	}

	private function setup(){
		super.setup();
		page.navigate( route( "/" ) );
		page.getByLabel( "Username:" ).fill( "testuseraccount" );
		page.getByLabel( "Password:" ).fill( "Password123!" );
		page.getByRole( "button", { name : "Sign In" } ).click();
		page.navigate( route( "/users" ) );
	}

}
