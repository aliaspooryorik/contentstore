component {

	// Configure ColdBox Application
	void function configure(){
		// coldbox directives
		coldbox = {
			// Application Setup
			appName : getSystemSetting( "APPNAME", "ContentStore" ),
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
			invalidEventHandler : "main.invalidevent",
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
			exclude : [
				"cbdebugger",
				"cbplaywright",
				"cfmigrations",
				"route-visualizer"
			]
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
		moduleSettings = {};
	}

	/**
	 * environment settings
	 */
	void function development(){
		modules.exclude = [];
		coldbox.invalidEventHandler = "";
		coldbox.handlersIndexAutoReload = true;
		coldbox.handlerCaching = false;
		coldbox.customErrorTemplate = "/coldbox/system/exceptions/Whoops.cfm";
	}
	void function testing(){
		coldbox.customErrorTemplate = "/coldbox/system/exceptions/BugReport.cfm";
	}

}
