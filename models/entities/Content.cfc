component extends="quick.models.BaseEntity" accessors="true" table="tblcontents" {

	property name="id" column="content_id";
	property name="slug";
    property name="title";
    property name="content";
    property name="active" casts="BooleanCast@quick";
    property name="createdDate";
    property name="modifiedDate";

	this.memento = { "neverInclude" : [ "" ] };
    this.constraints = {
        slug: { required: true, size: "3..255" },
        title: { required: true, size: "2..255" },
        content: { required: true }
    };

    function keyType() {
        return variables._wirebox.getInstance( "UUIDKeyType@quick" );
    }

    public boolean function isActive() {
        return variables.keyExists( "active" ) && variables.active;
    }

	public User function retrieveContentBySlug( required string slug ){
		return newEntity().where( "slug", arguments.slug ).firstOrFail();
	}

	public User function retrieveContentById( required numeric id ){
		return newEntity().findOrFail( arguments.id );
	}

}
