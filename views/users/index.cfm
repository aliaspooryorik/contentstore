<cfoutput>
	<h1>#prc.pageTitle#</h1>

	<a href="#event.buildLink( "users.new" )#" class="btn btn-primary">Create New User</a>

	#cbMessageBox().renderIt()#

	<cfif prc.Users.isEmpty()>
		<p>There are no users yet</p>
	<cfelse>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Username</th>
					<th scope="col">Email</th>
					<th scope="col">Name</th>
					<th scope="col">Active</th>
					<th scope="col">Edit</th>
					<th scope="col">View</th>
				</tr>
			</thead>
			<tbody>
			<cfloop array="#prc.Users#" item="item" index="i">
				<tr>
					<td>#item.getUsername()#</td>
					<td>#item.getEmail()#</td>
					<td>#item.getFullname()#</td>
					<td>#YesNoFormat( item.getActive() )#</td>
					<td><a href="#event.buildLink( "users.#item.getID()#.edit" )#" data-testid="row-#i#-edit-link">Edit</a></td>
					<td><a href="#event.buildLink( "users.#item.getID()#" )#" data-testid="row-#i#-view-link">View</a></td>
				<tr>
			</cfloop>
			</tbody>
		</table>
	</cfif>

</cfoutput>
