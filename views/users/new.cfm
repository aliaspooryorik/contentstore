<cfoutput>
	<h1>#prc.pageTitle#</h1>
	#cbMessageBox().renderIt()#
	#view( "users/_form", { method: "POST", action: event.buildLink( "users" ) } )#
</cfoutput>