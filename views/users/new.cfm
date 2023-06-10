<cfoutput>
<h1>New</h1>
#cbMessageBox().renderIt()#
#view( "users/_form", { method: "POST", action: event.buildLink( "users" ) } )#
</cfoutput>