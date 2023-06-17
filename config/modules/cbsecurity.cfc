component {

	struct function configure(){
		return {
			authentication : {
				provider         : "AuthenticationService@cbauth",
				userService      : "User",
				prcUserVariables : "user"
			},
			firewall : {
				validator                   : "AuthValidator@cbsecurity",
				invalidAuthenticationEvent  : "login",
				defaultAuthenticationAction : "redirect",
				invalidAuthorizationEvent   : "login",
				defaultAuthorizationAction  : "redirect"
			},
			securityHeaders : {
				// enabled at web server level
				hsts               : { enabled : false },
				frameOptions       : { enabled : false },
				xssProtection      : { enabled : false },
				referrerPolicy     : { enabled : false },
				contentTypeOptions : { enabled : false }
			}
		};
	}

}
