component {

	function init( page ){
		// playwright java page
		variables._page = page;
		variables._ariarole = createObject( "java", "com.microsoft.playwright.options.AriaRole" );
	}

	function click(){
		return variables._page.click();
	}

	function navigate( required string uri ){
		return variables._page.navigate( uri );
	}

	function title(){
		return variables._page.title();
	}

	function locator( required string element ){
		return variables._page.locator( element );
	}

	function pause(){
		return variables._page.pause();
	}

	function getByLabel( required string label ){
		return variables._page.getByLabel( label );
	}

	function getByRole( required string ariarole, required struct options ){
		var ByRoleOptions = newPageGetByRoleOptions().setName( options.name );
		if ( structKeyExists( options, "exact" ) ) {
			ByRoleOptions.setExact( options.exact ? true : false );
		}
		return variables._page.getByRole( getAriaRole( ariarole ), ByRoleOptions );
	}

	function getByText( required string text, struct options = {} ){
		if ( structKeyExists( options, "exact" ) ) {
			var ByRoleOptions.setExact( options.exact ? true : false );
			return variables._page.getByText( text, ByRoleOptions );
		}
		return variables._page.getByText( text );
	}

	function getByTestId( required string testid ) {
		return variables._page.getByTestId( testid );
	}

	function waitForLoadState( loadState, options ) {
		return variables._page.waitForLoadState( loadState, options );
	}

	private function getAriaRole( required string ariarole ){
		return variables._ariarole[ uCase( ariarole ) ];
	}

	private function newPageGetByRoleOptions(){
		return createObject( "java", "com.microsoft.playwright.Page$GetByRoleOptions" ).init();
	}

}
