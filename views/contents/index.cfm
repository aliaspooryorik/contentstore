<cfoutput>
<h1>content.index</h1>

<a href="#event.buildLink( "contents.new" )#">New content</a>

<cfif prc.Contents.isEmpty()>

<cfelse>
    <table>
    <cfloop array="#prc.Contents#" item="item">
        <tr>
            <th>#item.getTitle()#</th>
            <td><a href="#event.buildLink( "contents.#item.getID()#.edit" )#">Edit</a></td>
            <td><a href="#event.buildLink( "contents.#item.getID()#" )#">View</a></td>
        <tr>
    </cfloop>
    </table>
</cfif>

</cfoutput>
