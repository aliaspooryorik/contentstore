<cfoutput>


<form method="POST" action="#event.buildLink( "contents" )#">
    <div class="form-group">
        <label for="title">Title</label>
        <input type="text" class="form-control" name="title" id="title" required>
    </div>
    <div class="form-group">
        <label for="slug">Slug</label>
        <input type="text" class="form-control" name="slug" id="slug" required>
    </div>
    <div class="form-group">
        <label for="content">Content</label>
        <textarea type="text" class="form-control" name="content" id="content" rows="3" required></textarea>
    </div>
    <div class="form-group">
        <label for="active">Active</label>
        <input type="checkbox" class="form-control" name="active" id="active">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>

</cfoutput>