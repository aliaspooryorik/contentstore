<!-- Template -->
<cfoutput>
    <div class="form-group">
        <label for="slug">Slug</label>
        <input type="text" class="form-control" name="slug" id="slug" value="">
    </div>
</cfoutput>

<!-- Blueprint -->
<cfscript>
    // Data properties go here
    data = {
        "slug": ""// prc.Content.getSlug()
    };
    
    // Computed properties go here
    computed = {
    
    };

    constraints = {
        "slug": { 
            "required": true,
            "size": "10..500"
        }
    };
    
    // Actions go here
    function addSlug( required array postId ) {
    
    }
</cfscript>