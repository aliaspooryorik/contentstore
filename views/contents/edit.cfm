<cfoutput>
	<h1>#prc.pageTitle#</h1>
	#cbMessageBox().renderIt()#

	#view( "contents/_form", { method: "PUT", action: event.buildLink( "contents.#rc.ContentViewModel.getId()#" ) } )#
</cfoutput>
