<cfoutput>
	<form method="POST" action="#args.action#">
		<input type="hidden" name="_method" value="#args.method#">
		<input type="hidden" name="csrf" value="#csrfToken()#">
		<div class="mb-3">
			<label class="form-label" for="username">Username:</label>
			<input name="username" type="text" class="form-control" id="username" value="#rc.UserViewModel.getUsername()#" />
			#view( "users/_validationmessage", { field: "username" } )#
		</div>
		<div class="mb-3">
			<label class="form-label" for="firstname">First Name:</label>
			<input name="firstname" type="text" class="form-control" id="firstname" value="#rc.UserViewModel.getFirstname()#" />
			#view( "users/_validationmessage", { field: "firstname" } )#
		</div>
		<div class="mb-3">
			<label class="form-label" for="lastname">Last Name:</label>
			<input name="lastname" type="text" class="form-control" id="lastname" value="#rc.UserViewModel.getLastname()#" />
			#view( "users/_validationmessage", { field: "lastname" } )#
		</div>
		<div class="mb-3">
			<label class="form-label" for="email">Email Address:</label>
			<input name="email" type="email" class="form-control" id="email" value="#rc.UserViewModel.getEmail()#" />
			#view( "users/_validationmessage", { field: "email" } )#
		</div>
		<div class="mb-3">
			<label class="form-label" for="password">Password:</label>
			<input name="password" type="password" class="form-control" id="password" />
			#view( "users/_validationmessage", { field: "password" } )#
		</div>
		<div class="mb-3">
			<label class="form-label" for="passwordConfirmation">Password Confirmation:</label>
			<input name="passwordConfirmation" type="password" class="form-control" id="passwordConfirmation" />
			#view( "users/_validationmessage", { field: "passwordConfirmation" } )#
		</div>
		<div class="mb-3 form-check">
			<input name="active" type="checkbox" class="form-check-input" id="active" value="1" <cfif rc.UserViewModel.isActive()>checked</cfif>  />
			<label class="form-label" for="active" class="form-check-label">Active</label>
			#view( "users/_validationmessage", { field: "active" } )#
		</div>
		<div class="mb-3">
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</form>
</cfoutput>
