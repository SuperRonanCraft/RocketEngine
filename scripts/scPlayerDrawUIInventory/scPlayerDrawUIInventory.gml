///@arg x
///@arg y
///@arg alpha
if (!inventory_system) return false;

var _map = inventory_map;

if (scKeybindsGet(KEYBIND.INVENTORY)) {
	_map[? INVENTORY_MAP.OPEN] = !_map[? INVENTORY_MAP.OPEN];
	global.play = !_map[? INVENTORY_MAP.OPEN];
	if (_map[? INVENTORY_MAP.OPEN])
		SlideTransition(TRANS_MODE.PAUSE);
	else
		SlideTransition(TRANS_MODE.UNPAUSE);
	//player_map[? PLAYER_MAP.CAN_CONTROL] = !_map[? INVENTORY_MAP.OPEN];
	//Safety
	if (!_map[? INVENTORY_MAP.OPEN]) { //Put item back if moving
		var _inv_grid = _map[? INVENTORY_MAP.GRID];
		for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_ROWS]; xx++)
			for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_COLUMNS]; yy++) {
				var _slot_map = _inv_grid[# xx, yy];
				if (_slot_map[? ITEM_MAP.MOVING])
					_slot_map[? ITEM_MAP.MOVING] = false;
			}
	}
}

var _alpha = argument2;

if (_map[? INVENTORY_MAP.OPEN]) {
	_map[? INVENTORY_MAP.ALPHA] = min(_map[? INVENTORY_MAP.ALPHA] + _map[? INVENTORY_MAP.ALPHA_CHANGE], _alpha);
} else
	_map[? INVENTORY_MAP.ALPHA] = max(_map[? INVENTORY_MAP.ALPHA] - _map[? INVENTORY_MAP.ALPHA_CHANGE], 0);

if (_map[? INVENTORY_MAP.ALPHA] <= 0) return false;
var _x = argument0;
var _y = argument1;
_alpha = _map[? INVENTORY_MAP.OPEN] ? _alpha : _map[? INVENTORY_MAP.ALPHA];

//if (team == TEAM.RIGHT)
//	_x = RES_W - _x - sprite_get_width(sUIInventory);

//Inventory frame
scDrawSpriteExt(_x, _y, sUIInventoryBgd, 0, noone, _alpha);

var _buffer_x = 3; //Distance between inventory slots (x)
var _buffer_y = 3; //Distance between inventory slots (y)
var _inv_slot_size = 70;
var _inv_hovering = noone;
var _inv_moving = false;
var _inv_swap = [noone, noone];

_x = (RES_W / 2) - (((_map[? INVENTORY_MAP.SIZE_ROWS] / 2)) * _inv_slot_size) - (_buffer_x * (_map[? INVENTORY_MAP.SIZE_ROWS] / 2));
_y = (RES_H / 2) - (((_map[? INVENTORY_MAP.SIZE_COLUMNS] / 2)) * _inv_slot_size) - (_buffer_y * (_map[? INVENTORY_MAP.SIZE_COLUMNS] / 2));

//Draw Hovering/Slot
var _inv_grid = _map[? INVENTORY_MAP.GRID];
for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_ROWS]; xx++) {
	for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_COLUMNS]; yy++) {
		var _xx = (_x + _buffer_x) + (xx * _inv_slot_size + (xx * _buffer_x));
		var _yy = (_y + _buffer_y) + (yy * _inv_slot_size + (yy * _buffer_y));
		//Draw Inventory Slot
		var _slot_alpha = _alpha;
		if (scUIHoveringBox(_xx, _yy, _xx + _inv_slot_size, _yy + _inv_slot_size, 0, 0)) {
			_slot_alpha = ((1 - _alpha) / 2) + _alpha;
			_inv_hovering = [xx, yy];
		}
		var _sprite = sUIInventory, _sprite_index = 0;
		var _inv_slot_type = ds_grid_get(_map[? INVENTORY_MAP.GRID_TYPE], xx, yy);
		switch (_inv_slot_type) {
			case INVENTORY_SLOT_TYPE.WEAPON: _sprite = sUIInventoryUtil; _sprite_index = 0; break;
			case INVENTORY_SLOT_TYPE.ARMOR: _sprite = sUIInventoryUtil; _sprite_index = 1; break;
			case INVENTORY_SLOT_TYPE.ABILITY: _sprite = sUIInventoryUtil; _sprite_index = 2; break;
			case INVENTORY_SLOT_TYPE.GENERAL:
			default:
		}
		
		draw_sprite_part_ext(_sprite, _sprite_index, 0, 0, _inv_slot_size, _inv_slot_size, _xx, _yy, 1, 1, c_white, _slot_alpha);
		/*var _slot_hovering = scUIHoveringBox(_xx, _yy, _xx + _inv_slot_size, _yy + _inv_slot_size, 0, 0);
		//Hoving indicator
		if (_slot_hovering) {
			scDrawRect(_xx + 1, _yy + 1, _xx + 63, _yy + 63, c_white, false, _alpha / 2);
			_inv_hovering = [xx, yy];
		}*/
	}
}

//Draw Sprite
for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_ROWS]; xx++) {
	for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_COLUMNS]; yy++) {
		var _slot_map = _inv_grid[# xx, yy];
		var _xx = (_x + _buffer_x) + (xx * _inv_slot_size + (xx * _buffer_x));
		var _yy = (_y + _buffer_y) + (yy * _inv_slot_size + (yy * _buffer_y));
		
		var _item = _slot_map[? ITEM_MAP.ITEM];
		//Display item in inventory slot
		if (!_slot_map[? ITEM_MAP.MOVING] && _item != ITEM.NONE) { //Display if there is an item in a slot, //Draw this item later if moving
			var _sprite = _slot_map[? ITEM_MAP.SPRITE];
			var _item_w = sprite_get_width(_sprite);
			var _item_h = sprite_get_height(_sprite);
			draw_sprite_part_ext(_sprite, 0, 0, 0, _item_w, _item_h, _xx + (_inv_slot_size / 2) - (_item_w / 2), _yy + (_inv_slot_size / 2) - (_item_h / 2), 1, 1, c_white, _alpha);
			//scDrawSpriteExt(_xx, _yy, _sprite, 0, noone, _alpha);
			if (_slot_map[? ITEM_MAP.AMOUNT] > 1) //Amount if above 1
				scDrawText(_xx + _inv_slot_size, _yy + _inv_slot_size, string(_slot_map[? ITEM_MAP.AMOUNT]), c_white, 0.5, noone, _alpha, fa_right, fa_bottom);
			if (_slot_map[? ITEM_MAP.DURABILITY] != noone) { //Durability Bar
				scDrawRect(xx + 3, yy + 60, xx + 61, yy + 63, c_green, false, _alpha / 2);
			}
		}
		
		var _slot_hovering = scUIHoveringBox(_xx, _yy, _xx + _inv_slot_size, _yy + _inv_slot_size, 0, 0);
		//Clicking to move an item
		if (!_slot_map[? ITEM_MAP.MOVING])
			if (_item != ITEM.NONE && mouse_check_button_pressed(mb_left) && _slot_hovering)
				_slot_map[? ITEM_MAP.MOVING] = true;
		var _item = _slot_map[? ITEM_MAP.ITEM];
		if (_slot_map[? ITEM_MAP.MOVING]) {
			_inv_hovering = [xx, yy];
			_inv_moving = true; //Do not show description while moving item
			if (mouse_check_button_released(mb_left)) {
				_inv_swap[0] = [xx, yy]; //I am dropping, add my self to swap invs with another slot
				_slot_map[? ITEM_MAP.MOVING] = false;
			}
		} else if (_slot_hovering && mouse_check_button_released(mb_left))
			_inv_swap[1] = [xx, yy]; //I was released on, add my self to swap invs with a dropped item
	}
}

//Draw item tool tip

if (_inv_hovering != noone && _inv_moving == false) { //Are hovering over an item and not moving another item
	var _slot_map = _inv_grid[# _inv_hovering[0], _inv_hovering[1]];
	if (_slot_map[? ITEM_MAP.ITEM] != ITEM.NONE) {
		var _xx = device_mouse_x_to_gui(0);
		var _yy = device_mouse_y_to_gui(0);
		var _buffer = 5;
		var _text = string(_slot_map[? ITEM_MAP.NAME]);
		if (global.debug) {
			_text += 
				"\nItem Id: " + string(_slot_map[? ITEM_MAP.ITEM]) +
				"\nMax Stack: " + string(_slot_map[? ITEM_MAP.STACK_MAX]) +
				"\nGrid Pos: [" + string(_inv_hovering[0]) + ", " + string(_inv_hovering[1]) + "]";
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
} else if (_inv_hovering != noone && _inv_moving == true) { //Draw item we are moving
	var _xx = device_mouse_x_to_gui(0) - _inv_slot_size / 2;
	var _yy = device_mouse_y_to_gui(0) - _inv_slot_size / 2;
	var _slot_map = _inv_grid[# _inv_hovering[0], _inv_hovering[1]];
	var _item = _slot_map[? ITEM_MAP.ITEM];
	if (_item != ITEM.NONE) { //Display if there is an item in a slot
		var _sprite = _slot_map[? ITEM_MAP.SPRITE];
		var _item_w = sprite_get_width(_sprite);
		var _item_h = sprite_get_height(_sprite);
		var _offset_x = (_inv_slot_size / 2) - (_item_w / 2);
		var _offset_y = (_inv_slot_size / 2) - (_item_h / 2);
		draw_sprite_part_ext(_sprite, 0, 0, 0, _item_w, _item_h, _xx + _offset_x + 3, _yy + _offset_y + 3, 1, 1, c_white, _alpha);
		draw_sprite_part_ext(_sprite, 0, 0, 0, _item_w, _item_h, _xx + _offset_x, _yy + _offset_y, 1, 1, c_white, _alpha);
			
		//scDrawSpriteExt(_xx + 3, _yy + 3, _sprite, 0, c_black, _alpha / 2);
		//scDrawSpriteExt(_xx, _yy, _sprite, 0, noone, _alpha);
		if (_slot_map[? ITEM_MAP.AMOUNT] > 1) //Amount if above 1
			scDrawText(_xx + _inv_slot_size, _yy + _inv_slot_size, string(_slot_map[? ITEM_MAP.AMOUNT]), c_white, 0.5, noone, _alpha, fa_right, fa_bottom);
		if (_slot_map[? ITEM_MAP.DURABILITY] != noone) { //Durability Bar
			scDrawRect(xx + 3, yy + 60, xx + 61, yy + 63, c_green, false, _alpha / 2);
		}
	}
}

if (_inv_swap[0] != noone && _inv_swap[1] != noone) { //Swap items
	var _inv_1 = _inv_swap[0];
	var _inv_2 = _inv_swap[1];
	var _inv_1_map = _inv_grid[# _inv_1[0], _inv_1[1]];
	var _inv_2_map = _inv_grid[# _inv_2[0], _inv_2[1]];
	_inv_grid[# _inv_1[0], _inv_1[1]] = _inv_2_map;
	_inv_grid[# _inv_2[0], _inv_2[1]] = _inv_1_map;
}

return true;