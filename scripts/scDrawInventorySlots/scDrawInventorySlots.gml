function scDrawInventorySlots(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {
	//Draw inv types
	///@arg grid
	///@arg width
	///@arg height
	///@arg x
	///@arg y
	///@arg alpha
	///@arg slot-size
	///@arg scale
	///@arg buffer_x
	///@arg buffer_y
	///@arg inv_type

	var _grid = argument0;
	var _width = argument1;
	var _height = argument2;
	var _x = argument3;
	var _y = argument4;
	var _alpha = argument5
	var _inv_slot_size = argument6;
	var _scale = argument7; //FUTURE
	var _buffer_x = argument8; //Distance between inventory slots (x)
	var _buffer_y = argument9; //Distance between inventory slots (y)
	var _inv_type = argument10;

	///Hovering?
	for (var xx = 0; xx < _width; xx++)
		for (var yy = 0; yy < _height; yy++) {
			var _xx = (_x + _buffer_x) + (xx * _inv_slot_size + (xx * _buffer_x));
			var _yy = (_y + _buffer_y) + (yy * _inv_slot_size + (yy * _buffer_y));
			var _slot_hovering = scUIHoveringBox(_xx, _yy, _xx + _inv_slot_size, _yy + _inv_slot_size, _buffer_x, _buffer_y);
			if (_slot_hovering) {
				inventory_map[? INVENTORY_MAP.HOVERING_SLOT] = [xx, yy];
				inventory_map[? INVENTORY_MAP.HOVERING_INV] = _inv_type;
				break;
			}
		}

	var _inv_hovering = inventory_map[? INVENTORY_MAP.HOVERING_INV] == _inv_type ? inventory_map[? INVENTORY_MAP.HOVERING_SLOT] : noone;
	var _inv_moving_item = inventory_map[? INVENTORY_MAP.MOVING_ITEM];

	//Draw slot, highlight if hovering
	for (var yy = 0; yy < _height; yy++)
		for (var xx = 0; xx < _width; xx++) {
			var _xx = (_x + _buffer_x) + (xx * _inv_slot_size + (xx * _buffer_x));
			var _yy = (_y + _buffer_y) + (yy * _inv_slot_size + (yy * _buffer_y));
			var _slot_alpha = _alpha;
			var _color = c_white;
			var _slot_map = _grid[# xx, yy];
			var _sprite = sUIInventory, _sprite_index = 0, _hovering = false;
			if (_inv_hovering != noone && _inv_hovering[0] == xx && _inv_hovering[1] == yy) {
				_slot_alpha = 1;
				_hovering = true;
			}
			if (_inv_moving_item != noone)
				if (scInventoryStackable(_slot_map, _inv_moving_item))
					_color = c_orange;
				else if (!scInventorySwapable(_inv_moving_item, _slot_map, inventory_map[? INVENTORY_MAP.MOVING_INV], _inv_type))
					_color = c_red;
			
			if (_hovering) {
				draw_sprite_part_ext(_sprite, _sprite_index, 0, 0, _inv_slot_size, _inv_slot_size, _xx, _yy, 1, 1, c_black, _slot_alpha);
				_xx -= 3;
				_yy -= 3;
			}
			draw_sprite_part_ext(_sprite, _sprite_index, 0, 0, _inv_slot_size, _inv_slot_size, _xx, _yy, 1, 1, _color, _slot_alpha);
		}

	//Draw Sprite
	for (var xx = 0; xx < _width; xx++)
		for (var yy = 0; yy < _height; yy++) {
			var _slot_map = _grid[# xx, yy];
			//Display item in inventory slot
			var _xx = (_x + _buffer_x) + (xx * _inv_slot_size + (xx * _buffer_x));
			var _yy = (_y + _buffer_y) + (yy * _inv_slot_size + (yy * _buffer_y));
			var _hovering = _inv_hovering != noone && _inv_hovering[0] == xx && _inv_hovering[1] == yy;
			var _off_x = 0;
			var _off_y = 0;
			if (_hovering) {
				_off_x -= 3;
				_off_y -= 3;
			}
			scDrawInventoryItem(_slot_map, _xx, _yy, _inv_slot_size, _alpha, true, true, _off_x, _off_y);
		}


}
