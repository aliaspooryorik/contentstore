<cfoutput>
	<cfif msgStruct.type eq "error">
		<div class="alert alert-danger" role="alert">
			#msgStruct.message#
		</div>
	<cfelse>
		<div class="alert alert-#msgStruct.type#" role="alert">
			#msgStruct.message#
		</div>
	</cfif>
</cfoutput>
