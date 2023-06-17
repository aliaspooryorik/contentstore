<cfoutput>
<form method="POST" action="#args.action#">
	<input type="hidden" name="_method" value="#args.method#">
	<input type="hidden" name="csrf" value="#csrfToken()#">
	<div class="mb-3">
		<label class="form-label" for="slug">Slug</label>
		<input type="text" class="form-control" name="slug" id="slug" value="#rc.ContentViewModel.getSlug()#" required>
		#view( "users/_validationmessage", { field: "slug" } )#
	</div>
	<div class="mb-3">
		<label class="form-label" for="title">Title</label>
		<input type="text" class="form-control" name="title" id="title" value="#rc.ContentViewModel.getTitle()#" required>
		#view( "users/_validationmessage", { field: "title" } )#
	</div>
	<div class="mb-3">
		<label class="form-label" for="content">Content</label>
		<textarea type="text" class="form-control" name="content" id="content" rows="3" required>#rc.ContentViewModel.getContent()#</textarea>
		#view( "users/_validationmessage", { field: "content" } )#
	</div>
	<div class="form-check">
		<input name="active" type="checkbox" class="form-check-input" id="active" value="1" <cfif rc.ContentViewModel.isActive()>checked</cfif> />
		<label class="form-label" for="active" class="form-check-label">Active</label>
	</div>
	<button type="submit" class="btn btn-primary">Submit</button>
</form>

</cfoutput>