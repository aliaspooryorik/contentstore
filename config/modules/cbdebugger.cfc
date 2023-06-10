component {

	function configure(){
		return {};
	}

	function development( struct moduleSettings ){
		moduleSettings.collections.enabled = true;
		moduleSettings.collections.maxDumpTop = 2;
	}

}
