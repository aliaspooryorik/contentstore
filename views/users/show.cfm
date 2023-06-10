<cfoutput>
<h1>Show</h1>
#cbMessageBox().renderIt()#
<form method="POST" action="#event.buildLink( "users.#prc.User.getID()#" )#">
    <input type="hidden" name="_method" value="DELETE">
    <input type="hidden" name="csrf" value="#csrfToken()#">
    <button type="submit" class="btn">Delete</button>
</form>

<h1>#prc.User.getEmail()#</h1>
<p>#prc.User.getActive()#</p>

</cfoutput>