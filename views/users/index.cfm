<cfoutput>
<h1>content.index</h1>

<a href="#event.buildLink( "users.new" )#" class="btn btn-primary">New User</a>

#cbMessageBox().renderIt()#

<cfif prc.Users.isEmpty()>
    <p>There are not users yet</p>
<cfelse>
    <table>
    <cfloop array="#prc.Users#" item="item">
        <tr>
            <th>#item.getEmail()#</th>
            <td><a href="#event.buildLink( "users.#item.getID()#.edit" )#">Edit</a></td>
            <td><a href="#event.buildLink( "users.#item.getID()#" )#">View</a></td>
        <tr>
    </cfloop>
    </table>
</cfif>

</cfoutput>
