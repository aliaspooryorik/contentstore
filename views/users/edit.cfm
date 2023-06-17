<cfoutput>
	<h1>#prc.pageTitle#</h1>
	#cbMessageBox().renderIt()#

	<cfif auth().getUser().getID() eq rc.UserViewModel.getId()>
		<div class="alert alert-warning" role="alert">This is You!</div>
	</cfif>

	#view( "users/_form", { method: "PUT", action: event.buildLink( "users.#rc.UserViewModel.getId()#" ) } )#
</cfoutput>
