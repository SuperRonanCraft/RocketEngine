//MAIN SCREEN
///@arg x
///@arg y
///@arg alpha

var _map = inventory_map;

var _x = argument0;
var _y = argument1;
var _alpha = argument2;

//if (team == TEAM.RIGHT)
//	_x = RES_W - _x - sprite_get_width(sUIInventory);

//Inventory frame
scDrawSpriteExt(_x + 20, _y + 20, sUIInventoryBgd, 0, noone, _alpha);

var _buffer_x = 16; //Distance between inventory slots (x)
var _buffer_y = 16; //Distance between inventory slots (y)
var _inv_slot_size = 70;
var _inv_hovering = noone;
var _inv_moving = noone;
var _inv_swap_from = noone;
var _inv_swap_to = noone;

//_x = (RES_W / 2) - (((_map[? INVENTORY_MAP.SIZE_GENERAL_ROW] / 2)) * _inv_slot_size) - (_buffer_x * (_map[? INVENTORY_MAP.SIZE_GENERAL_ROW] / 2));
//_y = (RES_H / 2) - (((_map[? INVENTORY_MAP.SIZE_GENERAL_COLUMN] / 2)) * _inv_slot_size) - (_buffer_y * (_map[? INVENTORY_MAP.SIZE_GENERAL_COLUMN] / 2));

/*///Hovering?
var _inv_grid = _map[? INVENTORY_MAP.GRID_GENERAL];
for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_GENERAL_ROW]; xx++) {
	for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_GENERAL_COLUMN]; yy++) {
		var _xx = (_x + _buffer_x) + (xx * _inv_slot_size + (xx * _buffer_x));
		var _yy = (_y + _buffer_y) + (yy * _inv_slot_size + (yy * _buffer_y));
		var _slot_hovering = scUIHoveringBox(_xx, _yy, _xx + _inv_slot_size, _yy + _inv_slot_size, _buffer_x, _buffer_y);
		if (_slot_hovering)
			_inv_hovering = [xx, yy];
	}
}

//Draw slot, highlight if hovering
for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_GENERAL_ROW]; xx++) {
	for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_GENERAL_COLUMN]; yy++) {
		var _xx = (_x + _buffer_x) + (xx * _inv_slot_size + (xx * _buffer_x));
		var _yy = (_y + _buffer_y) + (yy * _inv_slot_size + (yy * _buffer_y));
		//Draw Inventory Slot
		var _slot_alpha = _alpha;
		var _color = c_white;
		if (_inv_hovering != noone && _inv_hovering[0] == xx && _inv_hovering[1] == yy)
			_slot_alpha = 1;//((1 - _alpha) / 2) + _alpha;
		var _sprite = sUIInventory, _sprite_index = 0;
		/*var _inv_slot_type = ds_grid_get(_map[? INVENTORY_MAP.GRID_TYPE], xx, yy);
		switch (_inv_slot_type) {
			case INVENTORY_SLOT_TYPE.WEAPON: _sprite = sUIInventoryUtil; _sprite_index = 0; break;
			case INVENTORY_SLOT_TYPE.ARMOR: _sprite = sUIInventoryUtil; _sprite_index = 1; break;
			case INVENTORY_SLOT_TYPE.ABILITY: _sprite = sUIInventoryUtil; _sprite_index = 2; break;
			case INVENTORY_SLOT_TYPE.GENERAL:
			default: break;
		}*/
/*		var _slot_map = _inv_grid[# xx, yy];
		if (_slot_map != noone && _slot_map[? ITEM_MAP.MOVING])
			_color = c_gray;
		else {
			for (var xx2 = 0; xx2 < _map[? INVENTORY_MAP.SIZE_GENERAL_ROW]; xx2++)
				for (var yy2 = 0; yy2 < _map[? INVENTORY_MAP.SIZE_GENERAL_COLUMN]; yy2++) {
					var _slot_map_2 = _inv_grid[# xx2, yy2];
					if (_slot_map_2 != noone && _slot_map_2[? ITEM_MAP.MOVING])
						if (!scInventorySwapable(xx, yy, xx2, yy2))
							_color = c_red;
						else if (scInventoryStackable(xx, yy, xx2, yy2))
							_color = c_orange;
						//else
						//	_color = c_purple;
				}
		}
		
		draw_sprite_part_ext(_sprite, _sprite_index, 0, 0, _inv_slot_size, _inv_slot_size, _xx, _yy, 1, 1, _color, _slot_alpha);
		/*var _slot_hovering = scUIHoveringBox(_xx, _yy, _xx + _inv_slot_size, _yy + _inv_slot_size, 0, 0);
		//Hoving indicator
		if (_slot_hovering) {
			scDrawRect(_xx + 1, _yy + 1, _xx + 63, _yy + 63, c_white, false, _alpha / 2);
			_inv_hovering = [xx, yy];
		}*/
/*	}
}

//Draw Sprite
for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_GENERAL_ROW]; xx++) {
	for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_GENERAL_COLUMN]; yy++) {
		var _slot_map = _inv_grid[# xx, yy];
		//Display item in inventory slot
		if (_slot_map != noone && !_slot_map[? ITEM_MAP.MOVING] && _slot_map[? ITEM_MAP.ITEM] != ITEM.NONE) { //Display if there is an item in a slot, //Draw this item later if moving
			var _xx_goal = (_x + _buffer_x) + (xx * _inv_slot_size + (xx * _buffer_x));
			var _yy_goal = (_y + _buffer_y) + (yy * _inv_slot_size + (yy * _buffer_y));
			var _xx = _slot_map[? ITEM_MAP.XX] != 0 ? lerp(_slot_map[? ITEM_MAP.XX], _xx_goal, 0.1) : _xx_goal;
			var _yy = _slot_map[? ITEM_MAP.YY] != 0 ? lerp(_slot_map[? ITEM_MAP.YY], _yy_goal, 0.1) : _yy_goal;
			_slot_map[? ITEM_MAP.XX] = _xx;
			_slot_map[? ITEM_MAP.YY] = _yy;
			var _sprite = _slot_map[? ITEM_MAP.SPRITE];
			var _scale = _slot_map[? ITEM_MAP.SCALE];
			var _item_w = sprite_get_width(_sprite);
			var _item_h = sprite_get_height(_sprite);
			draw_sprite_part_ext(
				_sprite, 0, 0, 0, _item_w, _item_h, _xx + (_inv_slot_size / 2) - ((_item_w * _scale) / 2),
				_yy + (_inv_slot_size / 2) - ((_item_h * _scale) / 2), _scale, _scale, c_white, _alpha);
			//scDrawSpriteExt(_xx, _yy, _sprite, 0, noone, _alpha);
			if (_slot_map[? ITEM_MAP.AMOUNT] > 1) //Amount if above 1
				scDrawText(_xx + _inv_slot_size, _yy + _inv_slot_size, string(_slot_map[? ITEM_MAP.AMOUNT]), c_white, 0.5, noone, _alpha, fa_right, fa_bottom);
			if (_slot_map[? ITEM_MAP.DURABILITY] != noone) { //Durability Bar
				scDrawRect(xx + 3, yy + 60, xx + 61, yy + 63, c_green, false, _alpha / 2);
			}
		}
		
		//Item is moving?
		var _slot_hovering = _inv_hovering != noone && _inv_hovering[0] == xx && _inv_hovering[1] == yy;
		if (_slot_map != noone && !_slot_map[? ITEM_MAP.MOVING])
			if (_slot_map[? ITEM_MAP.ITEM] != ITEM.NONE && _slot_hovering && mouse_check_button_pressed(mb_left))
				_slot_map[? ITEM_MAP.MOVING] = true;
		//Item Swapping
		if (_slot_map != noone && _slot_map[? ITEM_MAP.MOVING]) {
			//_inv_hovering = [xx, yy];
			_inv_moving = [xx, yy]; //Do not show description while moving item
			if (mouse_check_button_released(mb_left)) {
				_inv_swap_from = [xx, yy]; //I am dropping, add my self to swap invs with another slot
				_slot_map[? ITEM_MAP.MOVING] = false;
			}
		} else if (_slot_hovering && mouse_check_button_released(mb_left))
			_inv_swap_to = [xx, yy]; //I was released on, add my self to swap invs with a dropped item
	}
}

//Draw item tool tip

if (_inv_hovering != noone && _inv_moving == noone) { //Are hovering over an item and not moving another item
	var _slot_map = _inv_grid[# _inv_hovering[0], _inv_hovering[1]];
	if (_slot_map != noone && _slot_map[? ITEM_MAP.ITEM] != ITEM.NONE || global.debug) {
		var _xx = device_mouse_x_to_gui(0);
		var _yy = device_mouse_y_to_gui(0);
		var _buffer = 5;
		var _text = _slot_map != noone ? string(_slot_map[? ITEM_MAP.NAME]) : "";
		if (global.debug) {
			_text += 
				(_slot_map != noone ? "\nItem Id: " + string(_slot_map[? ITEM_MAP.ITEM]) : "") +
				(_slot_map != noone ? "\nMax Stack: " + string(_slot_map[? ITEM_MAP.STACK_MAX]) : "") +
				"\nGrid Pos: [" + string(_inv_hovering[0]) + ", " + string(_inv_hovering[1]) + "]" +
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
} else if (/*_inv_hovering != noone &&*//* _inv_moving != noone) { //Draw item we are moving
/*	var _xx = device_mouse_x_to_gui(0) - _inv_slot_size / 2;
	var _yy = device_mouse_y_to_gui(0) - _inv_slot_size / 2;
	var _slot_map = _inv_grid[# _inv_moving[0], _inv_moving[1]];
	var _item = _slot_map[? ITEM_MAP.ITEM];
	if (_item != ITEM.NONE) { //Display if there is an item in a slot
		_slot_map[? ITEM_MAP.XX] = _xx;
		_slot_map[? ITEM_MAP.YY] = _yy;
		var _sprite = _slot_map[? ITEM_MAP.SPRITE];
		var _scale = _slot_map[? ITEM_MAP.SCALE];
		var _item_w = sprite_get_width(_sprite);
		var _item_h = sprite_get_height(_sprite);
		var _offset_x = (_inv_slot_size / 2) - ((_item_w * _scale) / 2);
		var _offset_y = (_inv_slot_size / 2) - ((_item_h * _scale) / 2);
		draw_sprite_part_ext(_sprite, 0, 0, 0, _item_w, _item_h, _xx + _offset_x + 3, _yy + _offset_y + 3, _scale, _scale, c_black, _alpha);
		draw_sprite_part_ext(_sprite, 0, 0, 0, _item_w, _item_h, _xx + _offset_x, _yy + _offset_y, _scale, _scale, c_white, _alpha);
		if (_slot_map[? ITEM_MAP.AMOUNT] > 1) //Amount if above 1
			scDrawText(_xx + _inv_slot_size, _yy + _inv_slot_size, string(_slot_map[? ITEM_MAP.AMOUNT]), c_white, 0.5, noone, _alpha, fa_right, fa_bottom);
		if (_slot_map[? ITEM_MAP.DURABILITY] != noone) { //Durability Bar
			scDrawRect(xx + 3, yy + 60, xx + 61, yy + 63, c_green, false, _alpha / 2);
		}
	}
}

if (_inv_swap_from != noone && _inv_swap_to != noone) { //Swap items
	var _map_from = _inv_grid[# _inv_swap_from[0], _inv_swap_from[1]];
	var _map_to = _inv_grid[# _inv_swap_to[0], _inv_swap_to[1]];
	if (scInventoryStackable(_inv_swap_to[0], _inv_swap_to[1], _inv_swap_from[0], _inv_swap_from[1])) {
		var _map_1 = _inv_grid[# _inv_swap_from[0], _inv_swap_from[1]];
		var _map_2 = _inv_grid[# _inv_swap_to[0], _inv_swap_to[1]];
		var _curAmount_1 = _map_1[? ITEM_MAP.AMOUNT];
		var _curAmount_2 = _map_2[? ITEM_MAP.AMOUNT];
		var _maxStack = _map_1[? ITEM_MAP.STACK_MAX];
		if (_curAmount_1 + _curAmount_2 <= _maxStack) { //One stack can fit into another
			_map_2[? ITEM_MAP.AMOUNT] += _map_1[? ITEM_MAP.AMOUNT];
			_inv_grid[# _inv_swap_from[0], _inv_swap_from[1]] = noone;
			_inv_grid[# _inv_swap_to[0], _inv_swap_to[1]] = _map_2;
			ds_map_destroy(_map_1);
		} else { //Too many items to fit in one stack
			var _dif = _maxStack - _curAmount_2;
			if (_dif == 0) {
				_inv_grid[# _inv_swap_from[0], _inv_swap_from[1]] = _map_2;
				_inv_grid[# _inv_swap_to[0], _inv_swap_to[1]] = _map_1;
			} else {
				_map_2[? ITEM_MAP.AMOUNT] -= -_dif;
				_map_1[? ITEM_MAP.AMOUNT] += -_dif;
			}
		}
	} else if (scInventorySwapable(_inv_swap_from[0], _inv_swap_from[1], _inv_swap_to[0], _inv_swap_to[1])) {
		_inv_grid[# _inv_swap_from[0], _inv_swap_from[1]] = _map_to;
		_inv_grid[# _inv_swap_to[0], _inv_swap_to[1]] = _map_from;
	}
}

return true;