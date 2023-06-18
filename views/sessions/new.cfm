<cfoutput>
	<h3>Log In</h3>
	<hr />
	#cbMessageBox().renderIt()#

	<form method="POST" action="#event.buildLink( "login" )#">
		<input type="hidden" name="csrf" value="#csrfToken()#">
		<div class="mb-3">
			<label class="form-label" for="username">Username:</label>
			<input name="username" type="text" class="form-control" id="username">
		<!---
			<cfif prc.errors.keyExists( "username" )>
				<small class="form-text text-danger">
					<cfloop array="#prc.errors.username#" index="error">
						<p>#error.message#</p>
					</cfloop>
				</small>
			</cfif>
		--->
		</div>
		<div class="mb-3">
			<label class="form-label" for="password">Password:</label>
			<input name="password" type="password" class="form-control" id="password">
	<!---
			<cfif prc.errors.keyExists( "password" )>
				<small class="form-text text-danger">
					<cfloop array="#prc.errors.password#" index="error">
						<p>#error.message#</p>
					</cfloop>
				</small>
			</cfif>
	--->
		</div>
		<div class="mb-3">
			<button type="submit" class="btn btn-primary">Sign In</button>
		</div>
	</form>
</cfoutput>
