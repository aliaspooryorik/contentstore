component {

	function configure(){
		return {
			enableAutoVerifier     : false,
			enableAuthTokenRotator : false,
			rotationTimeout        : 60
		};
	}

	function development( struct moduleSettings ){
		moduleSettings.verifyExcludes.append( "^cbdebugger:" );
	}

}
