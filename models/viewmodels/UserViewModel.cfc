component accessors="true" {

	property name="wirebox" inject="wirebox";

	property name="id";
	property name="email";
	property name="password";
	property name="passwordConfirmation";
	property name="active" getter="false";

	this.memento = {
		defaultIncludes : [ "id", "email", "active" ],
		neverInclude    : [ "passwordConfirmation" ],
		defaults        : { active : 0 },
		profiles        : { persistance : { defaultIncludes : [ "id", "email", "active", "password" ] } }
	};

	boolean function getActive(){
		return !isNull( variables.active ) && variables.active;
	}

	struct function contextConstraints( required string context ){
		var result = {
			email : {
				required         : true,
				type             : "email",
				uniqueindatabase : { "entity" : "user", "field" : "email" }
			},
			password : {
				passwordrules : {
					minSize      : 8,
					minUpperCase : 1,
					minLowerCase : 1,
					minNumeric   : 1,
					minSymbols   : 1
				}
			},
			passwordConfirmation : { sameAs : "password" }
		};

		if ( context == "create" ) {
			result.password.required = true;
		}
		if ( context == "update" ) {
		}
		return result;
	}

	private boolean function isUnique(){
	}

}
