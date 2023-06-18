component accessors="true" {

	property name="id";
	property name="username";
	property name="firstname";
	property name="lastname";
	property name="email";
	property name="password";
	property name="passwordConfirmation";
	property name="active";

	this.memento = { defaultIncludes : [ "*" ], neverInclude : [ "passwordConfirmation" ], defaults : { active : 0 } };

	boolean function isActive(){
		return !isNull( variables.active ) && variables.active;
	}

	struct function contextConstraints( required string context ){
		var result = {
			"username" : {
				"required" : true,
				"size" : "8..250",
				"uniqueindatabase" : { "entity" : "user", "field" : "username" }
			},
			"email" : {
				"required" : true,
				"type" : "email",
				"uniqueindatabase" : { "entity" : "user", "field" : "email" }
			},
			"firstname" : { "required" : true },
			"lastname" : { "required" : true },
			"password" : {
				"passwordrules" : {
					"minSize" : 8,
					"minUpperCase" : 1,
					"minLowerCase" : 1,
					"minNumeric" : 1,
					"minSymbols" : 1
				}
			},
			"passwordConfirmation" : { "sameAs" : "password" }
		};

		if ( context == "create" ) {
			result.password[ "required" ] = true;
			result.passwordConfirmation[ "required" ] = true;
		}
		if ( context == "update" ) {
		}
		return result;
	}

}
