component extends="coldbox.system.testing.BaseModelTest" model="models.validators.PasswordRules" {

	function beforeAll(){
		setup();
	}

	function afterAll(){
		super.afterAll();
	}


	function run(){
		describe( "Password Validator", function() {
			var ValidationResult = {};
			beforeEach( function() {
				ValidationResult = createMock( "cbvalidation.models.result.ValidationResult" ).init();
			} );
			given( "I have an instance", function() {
				it( "should have a name of PasswordRules", function() {
					expect( model.getName() ).toBe( "PasswordRules" );
				} );
			} );
			given( "I all validation properties to a min occurance of 0", function() {
				when( "I validate a given value", function() {
					then( "a blank string should pass as this validator is not responsible for checking if required", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "",
								validationData = noRequiredRules()
							)
						).toBe( true );
					} );
					then( "a weak string should pass as this validator has no rules configured so anything is valid", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "a",
								validationData = noRequiredRules()
							)
						).toBe( true );
					} );
					then( "should the failure message should have min values for each parameter", function() {
						makePublic( model, "failureMessage" );
						expect( model.failureMessage( noRequiredRules() ) ).toBe( "" );
					} );
				} );
			} );
			given( "I require a minimum length", function() {
				when( "I validate a given value", function() {
					then( "a short string should fail", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "1234",
								validationData = minimumRequiredRule( { minsize : 5 } )
							)
						).toBe( false );
					} );
					then( "a long string should pass", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "12345678",
								validationData = minimumRequiredRule( { minsize : 5 } )
							)
						).toBe( true );
					} );
				} );
			} );
			given( "I require minlowercase", function() {
				when( "I validate a given value", function() {
					then( "a string with no lowercase should fail", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "ABCDEFGHI",
								validationData = minimumRequiredRule( { minlowercase : 2 } )
							)
						).toBe( false );
					} );
					then( "a string with expected lowercase should pass", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "AbcDEFGHI",
								validationData = minimumRequiredRule( { minlowercase : 2 } )
							)
						).toBe( true );
					} );
				} );
			} );
			given( "I require minuppercase", function() {
				when( "I validate a given value", function() {
					then( "a string with no uppercase should fail", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "abcdefghi",
								validationData = minimumRequiredRule( { minuppercase : 2 } )
							)
						).toBe( false );
					} );
					then( "a string with expected uppercase should pass", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "aBCdefghi",
								validationData = minimumRequiredRule( { minuppercase : 2 } )
							)
						).toBe( true );
					} );
				} );
			} );
			given( "I require minnumeric", function() {
				when( "I validate a given value", function() {
					then( "a string with no numeric should fail", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "abcdefghi",
								validationData = minimumRequiredRule( { minnumeric : 2 } )
							)
						).toBe( false );
					} );
					then( "a string with expected numeric should pass", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "a12defghi",
								validationData = minimumRequiredRule( { minnumeric : 2 } )
							)
						).toBe( true );
					} );
				} );
			} );
			given( "I require minsymbols", function() {
				when( "I validate a given value", function() {
					then( "a string with no numeric should fail", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "Abcdefghi12",
								validationData = minimumRequiredRule( { minsymbols : 2 } )
							)
						).toBe( false );
					} );
					then( "a string with expected numeric should pass", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "A@cd fghi12",
								validationData = minimumRequiredRule( { minsymbols : 2 } )
							)
						).toBe( true );
					} );
				} );
			} );
			given( "I have min values for all validation properties", function() {
				when( "I validate a given value", function() {
					then( "a blank string should pass as this validator is not responsible for checking if required", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "",
								validationData = allRequiredRules()
							)
						).toBe( true );
					} );
					then( "a string meeting the crtieria should pass", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "aA1 ",
								validationData = allRequiredRules()
							)
						).toBe( true );
					} );
					then( "a string exceeding the crtieria should pass", function() {
						expect(
							model.validate(
								validationResult = ValidationResult,
								target = {},
								field = "testField",
								targetValue = "aA1 bB2!",
								validationData = allRequiredRules()
							)
						).toBe( true );
					} );
					then( "the failure message should have min values for each parameter", function() {
						makePublic( model, "failureMessage" );
						expect( model.failureMessage( allRequiredRules() ) ).toBe( "At least 1 characters. At least 1 lowercase characters. At least 1 uppercase characters. At least 1 numeric characters. At least 1 special characters." );
					} );
				} );
			} );
		} );
	}


	private struct function noRequiredRules(){
		return {
			minsize : 0,
			minlowercase : 0,
			minuppercase : 0,
			minnumeric : 0,
			minsymbols : 0
		};
	}
	private struct function allRequiredRules(){
		return structMap( noRequiredRules(), function(key, value) {
			return 1;
		} );
	}
	private struct function minimumRequiredRule( struct rule ){
		var result = noRequiredRules();
		structAppend( result, rule );
		return result;
	}

}
