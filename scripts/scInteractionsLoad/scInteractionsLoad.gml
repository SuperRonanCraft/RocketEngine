var _file = "interactions.json";
var _wrapper = noone;
if (file_exists(_file)) {
	_wrapper = scLoadJsonFile(_file);
	var _list = _wrapper[? "ROOT"];
	
	for (var i = 0; i < ds_list_size(_list); i++) {
		var _map = _list[| i];
		show_debug_message("Loaded: " + _map[? "name"]);
	}
}

return _wrapper;