<cfoutput>
#cbMessageBox().renderIt()#

<form method="POST" action="#args.action#">
    <input type="hidden" name="_method" value="#args.method#">
    <div class="form-group">
        <label for="title">Title</label>
        <input type="text" class="form-control" name="title" id="title" value="#prc.Content.getTitle()#" required>
    </div>
    <div class="form-group">
        <label for="slug">Slug</label>
        <input type="text" class="form-control" name="slug" id="slug" value="#prc.Content.getSlug()#" required>
    </div>
    <div class="form-group">
        <label for="content">Content</label>
        <textarea type="text" class="form-control" name="content" id="content" rows="3" required>#prc.Content.getContent()#</textarea>
    </div>
    <div class="form-check">
        <input name="active" type="checkbox" class="form-check-input" id="active" <cfif prc.Content.isActive()>checked</cfif> />
        <label for="active">Active:</label>
        <!--- #view( "users/_validationmessage", { field: "active" } )# --->
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <input type="hidden" name="csrf" value="#csrfToken()#">
</form>

</cfoutput>