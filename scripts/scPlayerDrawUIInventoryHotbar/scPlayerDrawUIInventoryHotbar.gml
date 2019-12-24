//HOTBAR
///@arg x
///@arg y
///@arg alpha

var _map = inventory_map;

var _x = argument0;
var _y = argument1;
var _alpha = argument2;

/*//Draw slot, highlight if hovering
for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_ROWS]; xx++) {
	for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_COLUMNS]; yy++) {
		var _xx = (_x + _buffer_x) + (xx * _inv_slot_size + (xx * _buffer_x));
		var _yy = (_y + _buffer_y) + (yy * _inv_slot_size + (yy * _buffer_y));
		//Draw Inventory Slot
		var _slot_alpha = _alpha;
		var _color = c_white;
		if (_inv_hovering != noone && _inv_hovering[0] == xx && _inv_hovering[1] == yy)
			_slot_alpha = 1;//((1 - _alpha) / 2) + _alpha;
		var _sprite = sUIInventory, _sprite_index = 0;
		var _inv_slot_type = ds_grid_get(_map[? INVENTORY_MAP.GRID_TYPE], xx, yy);
		switch (_inv_slot_type) {
			case INVENTORY_SLOT_TYPE.WEAPON: _sprite = sUIInventoryUtil; _sprite_index = 0; break;
			case INVENTORY_SLOT_TYPE.ARMOR: _sprite = sUIInventoryUtil; _sprite_index = 1; break;
			case INVENTORY_SLOT_TYPE.ABILITY: _sprite = sUIInventoryUtil; _sprite_index = 2; break;
			case INVENTORY_SLOT_TYPE.GENERAL:
			default: break;
		}
		var _slot_map = _inv_grid[# xx, yy];
		if (_slot_map != noone && _slot_map[? ITEM_MAP.MOVING])
			_color = c_gray;
		else {
			for (var xx2 = 0; xx2 < _map[? INVENTORY_MAP.SIZE_ROWS]; xx2++)
				for (var yy2 = 0; yy2 < _map[? INVENTORY_MAP.SIZE_COLUMNS]; yy2++) {
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
for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_ROWS]; xx++) {
	for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_COLUMNS]; yy++) {
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