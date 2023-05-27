<cfoutput>
#html.startForm( method="DELETE", action=event.buildLink( "contents.#prc.Content.getID()#" ) )#
    <button type="submit" class="btn">Delete</button>
    <input type="hidden" name="csrf" value="#csrfToken()#">
#html.endForm()#

<h1>#prc.Content.getTitle()#</h1>
<pre>#prc.Content.getSlug()#</pre>

#prc.Content.getContent()#

</cfoutput>