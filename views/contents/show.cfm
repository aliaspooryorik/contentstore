<cfoutput>
	<h1>#prc.pageTitle#</h1>
	#cbMessageBox().renderIt()#
	<form method="POST" action="#event.buildLink( "contents.#prc.Content.getID()#" )#">
		<input type="hidden" name="_method" value="DELETE">
		<input type="hidden" name="csrf" value="#csrfToken()#">
		<button type="submit" class="btn btn-danger">Delete</button>
	</form>

	<table class="table">
		<tr>
			<th scope="row">ID</th>
			<td>#prc.Content.getID()#</td>
		</tr>
		<tr>
			<th scope="row">Slug</th>
			<td>#prc.Content.getSlug()#</td>
		</tr>
		<tr>
			<th scope="row">Title</th>
			<td>#prc.Content.getTitle()#</td>
		</tr>
		<tr>
			<th scope="row">Content</th>
			<td>#prc.Content.getContent()#</td>
		</tr>
		<tr>
			<th scope="row">Active</th>
			<td>#prc.Content.getActive()#</td>
		</tr>
	</table>



</cfoutput>