<cfoutput>
<h1>content.index</h1>

<a href="#event.buildLink( "contents.new" )#">New content</a>

<cfif prc.Contents.isEmpty()>

<cfelse>
    <table>
    <cfloop array="#prc.Contents#" item="item">
        <tr>
            <th>#item.getTitle()#</th>
        <tr>
    </cfloop>
    </table>
</cfif>

</cfoutput>
