component extends="cbPlaywright.models.ColdBoxPlaywrightTestCase" {

	this.interactiveBrowser = false;

	function beforeAll(){
		super.beforeAll();
		if ( this.interactiveBrowser ) {
			variables.browser = launchInteractiveBrowser( variables.playwright.chromium() );
		} else {
			variables.browser = launchBrowser( variables.playwright.chromium() );
		}
	}

	function afterAll(){
		super.afterAll();
	}

	function setup() {
		variables.context = variables.browser.newContext();
		variables.page = new PageDecorator( variables.context.newPage() );
	}

	function teardown() {
		variables.context.close();
	}

}
