<cfoutput>
    <form method="POST" action="#args.action#">
        <input type="hidden" name="_method" value="#args.method#">
        <input type="hidden" name="csrf" value="#csrfToken()#">
        <div class="form-group">
            <label for="email">Email Address:</label>
            <input name="email" type="email" class="form-control" id="email" />
            #view( "users/_validationmessage", { field: "email" } )#
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input name="password" type="password" class="form-control" id="password" />
            #view( "users/_validationmessage", { field: "password" } )#
        </div>
        <div class="form-group">
            <label for="passwordConfirmation">Password Confirmation:</label>
            <input name="passwordConfirmation" type="password" class="form-control" id="passwordConfirmation" />
            #view( "users/_validationmessage", { field: "passwordConfirmation" } )#
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form>
</cfoutput>
