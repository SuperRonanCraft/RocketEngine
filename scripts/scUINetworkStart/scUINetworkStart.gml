function scUINetworkStart() {
	if (global.network_name != "") {
		for (var i = 0; i < array_length(menu_pages); i++) {
			var _val = menu_pages[i];
			if (_val == ds_menu_type) {
				page = i;
				break;
			}
		}
	}


}
