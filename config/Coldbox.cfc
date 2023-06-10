component {

	// Configure ColdBox Application
	function configure(){
		// coldbox directives
		coldbox = {
			// Application Setup
			appName : getSystemSetting( "APPNAME", "Your app name here" ),
			eventName : "event",
			// Development Settings
			reinitPassword : "",
			handlersIndexAutoReload : false,
			// Implicit Events
			defaultEvent : "",
			requestStartHandler : "Main.onRequestStart",
			requestEndHandler : "",
			applicationStartHandler : "Main.onAppInit",
			applicationEndHandler : "",
			sessionStartHandler : "",
			sessionEndHandler : "",
			missingTemplateHandler : "",
			// Extension Points
			implicitViews : false,
			applicationHelper : "includes/helpers/ApplicationHelper.cfm",
			viewsHelper : "",
			modulesExternalLocation : [],
			viewsExternalLocation : "",
			layoutsExternalLocation : "",
			handlersExternalLocation : "",
			requestContextDecorator : "",
			controllerDecorator : "",
			// Error/Exception Handling
			invalidHTTPMethodHandler : "",
			exceptionHandler : "main.onException",
			invalidEventHandler : "",
			customErrorTemplate : "",
			// Application Aspects
			handlerCaching : true,
			eventCaching : false,
			viewCaching : false,
			// Will automatically do a mapDirectory() on your `models` for you.
			autoMapModels : true
		};

		// custom settings
		settings = {};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = { development : "localhost,^127\.0\.0\.1" };

		// Module Directives
		modules = {
			// An array of modules names to load, empty means all of them
			include : [],
			// An array of modules names to NOT load, empty means none
			exclude : []
		};

		// LogBox DSL
		logBox = {
			// Define Appenders
			appenders : { coldboxTracer : { class : "coldbox.system.logging.appenders.ConsoleAppender" } },
			// Root Logger
			root : { levelmax : "INFO", appenders : "*" },
			// Implicit Level Categories
			info : [ "coldbox.system" ]
		};

		// Layout Settings
		layoutSettings = { defaultLayout : "", defaultView : "" };

		// Interceptor Settings
		interceptorSettings = { customInterceptionPoints : "" };

		// Register interceptors as an array, we need order
		interceptors = [];


		// module setting overrides
		moduleSettings = {
			"cbauth" : { "userServiceClass" : "User" },
			"cbsecurity" : {
				"authentication" : {
					"provider" : "AuthenticationService@cbauth",
					"userService" : "User",
					"prcUserVariables" : "user"
				},
				"firewall" : {
					"validator" : "AuthValidator@cbsecurity",
					"invalidAuthenticationEvent" : "sessions.new",
					"defaultAuthenticationAction" : "redirect",
					"invalidAuthorizationEvent" : "sessions.new",
					"defaultAuthorizationAction" : "redirect"
				}
			},
			"cfmigrations" : {
				"managers" : {
					"default" : {
						"manager" : "cfmigrations.models.QBMigrationManager",
						"migrationsDirectory" : "resources/database/migrations/",
						"properties" : {
							"defaultGrammar" : "AutoDiscover@qb",
							"schema" : getSystemSetting( "DB_SCHEMA" ),
							"datasource" : getSystemSetting( "DB_DATABASE" )
						}
					}
				}
			}
		};

		/*
		// flash scope configuration
		flash = {
			scope = "session,client,cluster,ColdboxCache,or full path",
			properties = {}, // constructor properties for the flash scope implementation
			inflateToRC = true, // automatically inflate flash data into the RC scope
			inflateToPRC = false, // automatically inflate flash data into the PRC scope
			autoPurge = true, // automatically purge flash data for you
			autoSave = true // automatically save flash scopes at end of a request and on relocations.
		};

		//Register Layouts
		layouts = [
			{ name = "login",
		 	  file = "Layout.tester.cfm",
			  views = "vwLogin,test",
			  folders = "tags,pdf/single"
			}
		];

		//Conventions
		conventions = {
			handlersLocation = "handlers",
			viewsLocation 	 = "views",
			layoutsLocation  = "layouts",
			modelsLocation 	 = "models",
			eventAction 	 = "index"
		};
		*/
	}

	/**
	 * Development environment
	 */
	function development(){
		coldbox.handlersIndexAutoReload = true;
		coldbox.handlerCaching = false;
		coldbox.customErrorTemplate = "/coldbox/system/exceptions/Whoops.cfm";
	}

	function testing(){
		modules.exclude.append( "verify-csrf-interceptor" );
		moduleSettings.cfmigrations.managers[ "testing" ] = {
			"manager" : "cfmigrations.models.QBMigrationManager",
			"migrationsDirectory" : "/root/resources/database/migrations",
			"properties" : {
				"defaultGrammar" : "AutoDiscover@qb",
				"schema" : getSystemSetting( "TEST_DB_SCHEMA" ),
				"datasource" : getSystemSetting( "TEST_DB_DATABASE" )
			}
		};
	}

}
