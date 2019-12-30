//Draw item tool tip
///@arg slot_size
///@arg alpha


var _inv_slot_size = argument0;
var _alpha = argument1;

var _hovering_slot = inventory_map[? INVENTORY_MAP.HOVERING_SLOT];
var _hovering_inv = inventory_map[? INVENTORY_MAP.HOVERING_INV];
var _moving_item = inventory_map[? INVENTORY_MAP.MOVING_ITEM];

if (_hovering_slot != noone && _moving_item == noone) { //Are hovering over an item and not moving another item
	var _grid = noone;
	switch (_hovering_inv) {
		case INVENTORY_TYPE.GENERAL:
			_grid = inventory_map[? INVENTORY_MAP.GRID_GENERAL]; break;
		case INVENTORY_TYPE.WEAPON:
			_grid = inventory_map[? INVENTORY_MAP.GRID_WEAPON]; break;
		case INVENTORY_TYPE.AMMO:
			_grid = inventory_map[? INVENTORY_MAP.GRID_AMMO]; break;
		case INVENTORY_TYPE.ARMOR:
			_grid = inventory_map[? INVENTORY_MAP.GRID_ARMOR]; break;
	}
	var _slot_map = _grid[# _hovering_slot[0], _hovering_slot[1]];
	if (_slot_map != noone && _slot_map[? ITEM_MAP.ITEM] != ITEM.NONE || global.debug) {
		var _buffer = 10;
		var _xx = device_mouse_x_to_gui(0) + _buffer;
		var _yy = device_mouse_y_to_gui(0) + _buffer;
		var _list = ds_list_create();
		//var _text = _slot_map != noone ? string(_slot_map[? ITEM_MAP.NAME]) : "";
		ds_list_add(_list, _slot_map != noone ? "&f" + string(_slot_map[? ITEM_MAP.NAME]) : "&cNull");
		if (global.debug) {
			ds_list_add(_list, _slot_map != noone ? "&fItem Id: " + string(_slot_map[? ITEM_MAP.ITEM]) : "&f");
			ds_list_add(_list, _slot_map != noone ? "&fMax Stack: " + string(_slot_map[? ITEM_MAP.STACK_MAX]) : "&f");
			ds_list_add(_list, "&fGrid Pos: [" + string(_hovering_slot[0]) + ", " + string(_hovering_slot[1]) + "]");
			ds_list_add(_list, _slot_map != noone ? "&fItem Type: " + string(_slot_map[? ITEM_MAP.ITEM_TYPE]) : "&f");
			//ds_list_add(_list, "Slot Type: " + string(ds_grid_get(_map[? INVENTORY_MAP.GRID_TYPE], _inv_hovering[0], _inv_hovering[1])));
			/*_text += 
				(_slot_map != noone ? "\nItem Id: " + string(_slot_map[? ITEM_MAP.ITEM]) : "") +
				(_slot_map != noone ? "\nMax Stack: " + string(_slot_map[? ITEM_MAP.STACK_MAX]) : "") +
				"\nGrid Pos: [" + string(_hovering_slot[0]) + ", " + string(_hovering_slot[1]) + "]" +
				(_slot_map != noone ? "\nItem Type: " + string(_slot_map[? ITEM_MAP.ITEM_TYPE]) : "");
				//"\nSlot Type: " + string(ds_grid_get(_map[? INVENTORY_MAP.GRID_TYPE], _inv_hovering[0], _inv_hovering[1]));*/
		}
		var _scale = 0.5;
		var _len = 0;//string_width(_text) * _scale;
		var _hei_text = string_height(_list[| 0]) * _scale;
		var _hei = (_hei_text) * ds_list_size(_list);
		for (var i = 0; i < ds_list_size(_list); i++) {
			var _text = _list[| i];
			var _cur_len = (string_width(_text) * _scale);
			if (string_char_at(_text, 0) == "&")
				_cur_len -= (string_width("&a") * _scale);
			if (_cur_len > _len)
				_len = _cur_len;
		}
		var _size = scDrawNineSplice(sUIBox, _xx - _buffer, _yy - _buffer, _xx + _buffer + _len, _yy + _buffer + _hei, _alpha, _alpha);
		var _frame_len = _size[0];
		var _frame_hei = _size[1];
		var _x_offset = (_frame_len - _len - (_buffer * 2)) / 2;
		var _y_offset = (_frame_hei - _hei - (_buffer * 2)) / 2;
		for (var i = 0; i < ds_list_size(_list); i++) {
			scDrawText(_xx + _x_offset, _yy + _y_offset, _list[| i], c_white, _scale, noone, noone, fa_left, fa_top);
			_y_offset += _hei_text;
		}
	}
} else if (_moving_item != noone) { //Draw item we are moving from our inventory
	var _xx = device_mouse_x_to_gui(0) - _inv_slot_size / 2;
	var _yy = device_mouse_y_to_gui(0) - _inv_slot_size / 2;
	var _slot_map = _moving_item;
	scDrawInventoryItem(_slot_map, _xx, _yy, _inv_slot_size, _alpha, false, true);
}
if (_hovering_slot != noone && _moving_item == noone) { //Just hovering over an item
	if (keyboard_check_pressed(ord("Q"))) {
		var _grid = noone;
		switch (_hovering_inv) {
			case INVENTORY_TYPE.GENERAL:
				_grid = inventory_map[? INVENTORY_MAP.GRID_GENERAL]; break;
			case INVENTORY_TYPE.WEAPON:
				_grid = inventory_map[? INVENTORY_MAP.GRID_WEAPON]; break;
			case INVENTORY_TYPE.AMMO:
				_grid = inventory_map[? INVENTORY_MAP.GRID_AMMO]; break;
			case INVENTORY_TYPE.ARMOR:
				_grid = inventory_map[? INVENTORY_MAP.GRID_ARMOR]; break;
		}
		var _hov_item = _grid[# _hovering_slot[0], _hovering_slot[1]];
		if (_hov_item != noone) {
			scItemDrop(_hov_item, x, y);
			_grid[# _hovering_slot[0], _hovering_slot[1]] = noone;
		}
	}
}