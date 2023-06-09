/**
********************************************************************************
Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
*/
component {

	// APPLICATION CFC PROPERTIES
	this.name               = "ColdBoxTestingSuite" & hash( getCurrentTemplatePath() );
	this.sessionManagement  = true;
	this.sessionTimeout     = createTimespan( 0, 0, 15, 0 );
	this.applicationTimeout = createTimespan( 0, 0, 15, 0 );
	this.setClientCookies   = true;

	// Create testing mapping
	this.mappings[ "/tests" ]        = getDirectoryFromPath( getCurrentTemplatePath() );
	// Map back to its root
	rootPath                         = reReplaceNoCase( this.mappings[ "/tests" ], "tests(\\|/)", "" );
	this.mappings[ "/root" ]         = rootPath;
	this.mappings[ "/cbvalidation" ] = rootPath & "modules/cbvalidation";
	this.mappings[ "/cbPlaywright" ] = rootPath & "modules/cbPlaywright";
	this.mappings[ "/coldbox" ]      = rootPath & "coldbox";

	this.javaSettings = {
		loadPaths : directoryList(
			rootPath & "modules/cbPlaywright/lib",
			true,
			"array",
			"*jar"
		),
		loadColdFusionClassPath : true,
		reloadOnChange          : false
	};

	createObject( "java", "java.lang.System" ).setProperty( "ENVIRONMENT", "testing" );
	variables.util  = new coldbox.system.core.util.Util();
	this.datasource = variables.util.getSystemSetting( "TEST_DB_DATABASE" );


	public void function onRequestEnd(){
		structDelete( application, "cbController" );
		structDelete( application, "wirebox" );
	}

}
