component {

	struct function configure(){
		return {
			enableAutoVerifier     : false,
			enableAuthTokenRotator : false,
			rotationTimeout        : 60
		};
	}

	void function development( required struct moduleSettings ){
		moduleSettings.verifyExcludes.append( "^cbdebugger:" );
	}

}
