component {

	struct function configure(){
		return { enabled : false };
	}

	void function development( struct moduleSettings ){
		moduleSettings.enabled = true;
		moduleSettings.collections.enabled = true;
		moduleSettings.collections.maxDumpTop = 2;
	}

}
