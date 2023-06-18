component extends="coldbox.system.testing.BaseModelTest" model="models.validators.UniqueInDatabase" {

	function beforeAll(){
		setup();
		model.$property( propertyName = "wirebox", mock = variables.mockWireBox );
	}

	function afterAll(){
		super.afterAll();
	}


	function run(){
		describe( "Unique In Database Validator", function() {
			var ValidationResult = {};
			beforeEach( function() {
				ValidationResult = createMock( "cbvalidation.models.result.ValidationResult" ).init();
			} );
			given( "I have an instance", function() {
				it( "should have a name of UniqueInDatabase", function() {
					expect( model.getName() ).toBe( "UniqueInDatabase" );
				} );
			} );
		} );
	}

}
