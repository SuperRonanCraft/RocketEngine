function scInteractionsLoad() {
	var _file = "interactions.json";
	var _wrapper = noone;
	if (file_exists(_file)) {
		_wrapper = scLoadJsonFile(_file);
		/*var _list = _wrapper[? "CHARACTERS"];
	
		for (var i = 0; i < ds_list_size(_list); i++) {
			var _map = _list[| i];
			var _id = ds_map_find_first(_map);
			show_debug_message("--- Loading " + string(i))
			for (var a = 0; a < ds_map_size(_map); a++) {
				show_debug_message("Loaded: " + string(_id) + " = " + string(_map[? _id]));
				_id = ds_map_find_next(_map, _id);
			}
		}*/
	}

	return _wrapper;


}
