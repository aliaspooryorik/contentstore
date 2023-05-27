component {

    function configure() {
        return {};
    }

    function development( struct moduleSettings ) {
        moduleSettings.enableAutoVerifier = true;
        moduleSettings.enableAuthTokenRotator = true;
    }

}
