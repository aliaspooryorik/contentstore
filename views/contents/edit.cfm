<cfoutput>
#view( "contents/_form", { method: "PUT", action: event.buildLink( "contents.#prc.content.getId()#" ) } )#
</cfoutput>