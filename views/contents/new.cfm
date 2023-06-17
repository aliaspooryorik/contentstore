<cfoutput>
	<h1>#prc.pageTitle#</h1>
	#cbMessageBox().renderIt()#
	#view( "contents/_form", { method: "POST", action: event.buildLink( "contents" ) } )#
</cfoutput>