<cfoutput>
	<h1>#prc.pageTitle#</h1>
	#cbMessageBox().renderIt()#
	<form method="POST" action="#event.buildLink( "users.#prc.User.getID()#" )#">
		<input type="hidden" name="_method" value="DELETE">
		<input type="hidden" name="csrf" value="#csrfToken()#">
		<button type="submit" class="btn btn-danger">Delete</button>
	</form>

	<table class="table">
		<tr>
			<th scope="col">ID</th>
			<td>#prc.User.getID()#</td>
		</tr>
		<tr>
			<th scope="col">Username</th>
			<td>#prc.User.getUsername()#</td>
		</tr>
		<tr>
			<th scope="col">Email</th>
			<td>#prc.User.getEmail()#</td>
		</tr>
		<tr>
			<th scope="col">Name</th>
			<td>#prc.User.getFullname()#</td>
		</tr>
		<tr>
			<th scope="col">Active</th>
			<td>#prc.User.getActive()#</td>
		</tr>
	</table>

</cfoutput>