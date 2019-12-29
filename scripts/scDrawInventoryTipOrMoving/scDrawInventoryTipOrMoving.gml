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
		var _xx = device_mouse_x_to_gui(0);
		var _yy = device_mouse_y_to_gui(0);
		var _buffer = 5;
		var _text = _slot_map != noone ? string(_slot_map[? ITEM_MAP.NAME]) : "";
		if (global.debug) {
			_text += 
				(_slot_map != noone ? "\nItem Id: " + string(_slot_map[? ITEM_MAP.ITEM]) : "") +
				(_slot_map != noone ? "\nMax Stack: " + string(_slot_map[? ITEM_MAP.STACK_MAX]) : "") +
				"\nGrid Pos: [" + string(_hovering_slot[0]) + ", " + string(_hovering_slot[1]) + "]" +
				(_slot_map != noone ? "\nItem Type: " + string(_slot_map[? ITEM_MAP.ITEM_TYPE]) : "");
				//"\nSlot Type: " + string(ds_grid_get(_map[? INVENTORY_MAP.GRID_TYPE], _inv_hovering[0], _inv_hovering[1]));
		}
		var _scale = 0.5;
		var _len = string_width(_text) * _scale;
		var _hei = string_height(_text) * _scale;
		var _size = scDrawNineSplice(sUIBox, _xx, _yy, _xx + _len + (_buffer * 4), _yy + _hei + (_buffer * 4), _alpha, _alpha);
		var _frame_len = _size[0] - (_buffer * 4);
		var _frame_hei = _size[1] - (_buffer * 4);
		var _x_offset = (_frame_len - _len) / 2;
		var _y_offset = (_frame_hei - _hei) / 2;
		scDrawText(_xx + _buffer * 2 + _x_offset, _yy + _buffer * 2 + _y_offset, _text, c_white, _scale, noone, noone, fa_left, fa_top);
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