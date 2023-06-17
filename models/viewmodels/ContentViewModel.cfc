component accessors="true" {

	property name="id" column="content_id";
	property name="slug";
	property name="title";
	property name="content";
	property name="active";

	this.memento = {
		"defaultIncludes" : [ "*" ],
		"defaults"        : { "active" : 0 }
	};

	boolean function isActive(){
		return !isNull( variables.active ) && variables.active;
	}

	struct function contextConstraints( required string context ){
		var result = {
			"slug" : {
				"required"         : true,
				"size"             : "8..250",
				"regex"            : "^[a-z]{2}/[a-z0-9\-\_]+",
				"uniqueindatabase" : { "entity" : "content", "field" : "slug" }
			},
			"title"   : { "required" : true },
			"content" : { "required" : true }
		};
		return result;
	}

}
