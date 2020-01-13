/// @desc 
if (ds_list_size(ui_boxes) <= 0) exit;

var _remove = ds_list_create();
for (var i = 0; i < ds_list_size(ui_boxes); i++) {
	var _map = ui_boxes[| i];
	var _msg = _map[? "msg"];
	var _size = 0.4;
	var _len = string_width(_msg) * _size;
	var _hei = string_height(_msg) * _size;
	var _x = oPlayer.x;
	var _y = oPlayer.bbox_top - 40;
	var _buf = 8;
	scDrawNineSplice(sUIBox, _x - _len / 2 - 8 - _buf, _y - _hei / 2 - 8 - _buf, _x + _len / 2 + _buf, _y + _hei / 2 + _buf, _map[? "alpha"], _map[? "alpha"]);
	scDrawText(_x, _y, _msg, c_white, _size, noone, _map[? "alpha"]);
	_map[? "timer"] = max(_map[? "timer"] - 1, 0);
	if (_map[? "timer"] <= 0) {
		_map[? "alpha"] = max(_map[? "alpha"] - ui_alpha_reduce, 0);
		if (_map[? "alpha"] <= 0)
			ds_list_add(_remove, i);
	}
	if (i == 0) {
		var _x = camera_get_view_x(view_camera[0]) + 100, _y = camera_get_view_y(view_camera[0]) + 100;
		scDrawText(_x, _y, "Interact debug:", noone, 0.3, noone, noone, fa_left);
		scDrawText(_x, _y + 20, "msg: " + string(_map[? "msg"]), noone, 0.3, noone, noone, fa_left);
		scDrawText(_x, _y + 40, "to: " + string(_map[? "to"]), noone, 0.3, noone, noone, fa_left);
		scDrawText(_x, _y + 60, "from: " + string(_map[? "from"]), noone, 0.3, noone, noone, fa_left);
		scDrawText(_x, _y + 80, "timer: " + string(_map[? "timer"]), noone, 0.3, noone, noone, fa_left);
		scDrawText(_x, _y + 100, "alpha: " + string(_map[? "alpha"]), noone, 0.3, noone, noone, fa_left);
		scDrawText(_x, _y + 125, "amount to go: " + string(ds_list_size(ui_boxes)), noone, 0.3, noone, noone, fa_left);
	}
}

for (var i = 0; i < ds_list_size(_remove); i++) {
	var _map = ui_boxes[| _remove[| i]];
	ds_map_destroy(_map);
	ds_list_delete(ui_boxes, _remove[| i]);
}

ds_list_destroy(_remove);