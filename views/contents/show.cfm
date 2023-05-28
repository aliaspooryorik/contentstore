<cfoutput>
<form method="POST" action="#event.buildLink( "contents.#prc.Content.getID()#" )#">
    <input type="hidden" name="_method" value="DELETE">
    <input type="hidden" name="csrf" value="#csrfToken()#">
    <button type="submit" class="btn">Delete</button>
</form>

<h1>#prc.Content.getTitle()#</h1>
<pre>#prc.Content.getSlug()#</pre>

#prc.Content.getContent()#

</cfoutput>