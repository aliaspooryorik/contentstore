component extends="quick.models.BaseEntity" accessors="true" table="tblcontents" {

	property name="id" column="content_id";
	property name="slug";
    property name="title";
    property name="content";
    property name="active" casts="BooleanCast@quick";
    property name="createdDate";
    property name="modifiedDate";

	this.memento = { "defaultExcludes" : [ "id" ], "neverInclude" : [ ] };

    function keyType() {
        return variables._wirebox.getInstance( "UUIDKeyType@quick" );
    }

	public User function retrieveContentBySlug( required string slug ){
		return newEntity().where( "slug", arguments.slug ).firstOrFail();
	}

	public User function retrieveContentById( required numeric id ){
		return newEntity().findOrFail( arguments.id );
	}

}
