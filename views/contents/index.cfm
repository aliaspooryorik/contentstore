<cfoutput>
	<h1>#prc.pageTitle#</h1>

	<a href="#event.buildLink( "contents.new" )#" class="btn btn-primary">Create New Content</a>

	#cbMessageBox().renderIt()#

	<cfif prc.Contents.isEmpty()>
		<p>There are no contents yet</p>
	<cfelse>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Slug</th>
					<th scope="col">Title</th>
					<th scope="col">Active</th>
					<th scope="col">Edit</th>
					<th scope="col">View</th>
				</tr>
			</thead>
			<tbody>
			<cfloop array="#prc.Contents#" item="item" index="i">
				<tr>
					<td>#item.getSlug()#</td>
					<td>#item.getTitle()#</td>
					<td>#YesNoFormat( item.getActive() )#</td>
					<td><a href="#event.buildLink( "contents.#item.getID()#.edit" )#" data-testid="row-#i#-edit-link">Edit</a></td>
					<td><a href="#event.buildLink( "contents.#item.getID()#" )#" data-testid="row-#i#-view-link">View</a></td>
				<tr>
			</cfloop>
			</tbody>
		</table>
	</cfif>

	</cfoutput>
