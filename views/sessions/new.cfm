<cfoutput>
    <h3>Log In</h3>
    <hr />
    #cbMessageBox().renderIt()#
    
    <form method="POST" action="#event.buildLink( "login" )#">
        <input type="hidden" name="csrf" value="#csrfToken()#">
        <div class="form-group">
            <label for="email">Email Address:</label>
            <input name="email" type="text" class="form-control" id="email" />
<!---      
            <cfif prc.errors.keyExists( "email" )> 
                <small class="form-text text-danger">
                    <cfloop array="#prc.errors.email#" index="error">
                        <p>#error.message#</p>
                    </cfloop>
                </small>
            </cfif>
--->
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input name="password" type="password" class="form-control" id="password" />
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
        <div class="form-group">
            <button type="submit" class="btn btn-primary">Log In</button>
        </div>
    </form>
</cfoutput>
