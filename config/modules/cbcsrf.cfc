component {

    function configure() {
        return {
            enableAutoVerifier: true,
            enableAuthTokenRotator: true
        };
    }

    function development( struct moduleSettings ) {
        moduleSettings.verifyExcludes.append( "^cbdebugger:" );
    }

}
