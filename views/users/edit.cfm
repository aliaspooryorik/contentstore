<cfoutput>
<h1>Edit</h1>
#cbMessageBox().renderIt()#
#view( "users/_form", { method: "PUT", action: event.buildLink( "users.#prc.user.getId()#" ) } )#
</cfoutput>