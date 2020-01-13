/// @desc random interaction
var _list = interaction_map[? "CHARACTERS"];
var _num = irandom(ds_list_size(_list) - 1);
	
var _map = _list[| _num];
var _map_ui = ds_map_create();
var _msg_type = _map[? "msg"];
var _msg_list = _msg_type[? "RUDE"];
_map_ui[? "msg"] = _msg_list[| irandom(ds_list_size(_msg_list) - 1)];
var _to_list = _map[? "interact"];
_map_ui[? "to"] = _to_list[| irandom(array_length_1d(_to_list) - 1)];
_map_ui[? "from"] = _map[? "name"];
_map_ui[? "timer"] = 200;
_map_ui[? "alpha"] = 1;

ds_list_add(ui_boxes, _map_ui);