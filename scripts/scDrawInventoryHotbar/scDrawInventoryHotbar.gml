function scDrawInventoryHotbar(argument0, argument1, argument2) {
	//HOTBAR
	///@arg x
	///@arg y
	///@arg alpha

	var _map = inventory_map;

	var _x = argument0;
	var _y = argument1;
	var _alpha = argument2;

	if (mouse_wheel_down())
		_map[? INVENTORY_MAP.HOTBAR_SELECTED]++;
	else if (mouse_wheel_up())
		_map[? INVENTORY_MAP.HOTBAR_SELECTED]--;

	if (_map[? INVENTORY_MAP.HOTBAR_SELECTED] < 0)
		_map[? INVENTORY_MAP.HOTBAR_SELECTED] = _map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH] - 1;
	else if (_map[? INVENTORY_MAP.HOTBAR_SELECTED] >= _map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH])
		_map[? INVENTORY_MAP.HOTBAR_SELECTED] = 0;

	var _buffer_x = 16; //Distance between inventory slots (x)
	//var _buffer_y = 16; //Distance between inventory slots (y)
	var _inv_slot_size = 70;
	var _inv_grid = _map[? INVENTORY_MAP.GRID_GENERAL];
	var _selected = _map[? INVENTORY_MAP.HOTBAR_SELECTED];

	_x = (RES_W / 2) - ((_map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH] / 2) * _inv_slot_size) - ((_map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH] / 2) * _buffer_x);
	_y = RES_H - _inv_slot_size;
	//Draw slot, highlight if hovering
	for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH]; xx++) {
		var yy = _map[? INVENTORY_MAP.SIZE_GENERAL_HEIGHT] - 1;
		var _xx = (_x + _buffer_x) + (xx * _inv_slot_size + (xx * _buffer_x));
		var _yy = _y;
		//Draw Inventory Slot
		var _slot_alpha = _selected == xx ? _alpha : _alpha / 2;
		var _sprite = sUIInventory, _sprite_index = 1;
		var _slot_map = _inv_grid[# xx, yy];
		
		draw_sprite_part_ext(_sprite, _sprite_index, 0, 0, _inv_slot_size, _inv_slot_size, _xx, _yy, 1, 1, c_white, _slot_alpha);
		var _slot_map = _inv_grid[# xx, yy];
		scDrawInventoryItem(_slot_map, _xx, _yy, _inv_slot_size, _alpha, false, false);
		/*if (_slot_map == noone || _slot_map[? ITEM_MAP.ITEM] == ITEM.NONE) continue;
		var _sprite = _slot_map[? ITEM_MAP.SPRITE];
		var _scale = _slot_map[? ITEM_MAP.SCALE];
		var _item_w = sprite_get_width(_sprite);
		var _item_h = sprite_get_height(_sprite);
		draw_sprite_part_ext(
			_sprite, 0, 0, 0, _item_w, _item_h, _xx + (_inv_slot_size / 2) - ((_item_w * _scale) / 2),
			_yy + (_inv_slot_size / 2) - ((_item_h * _scale) / 2), _scale, _scale, c_white, _slot_alpha);
		if (_slot_map[? ITEM_MAP.AMOUNT] > 1) //Amount if above 1
			scDrawText(_xx + _inv_slot_size, _yy + _inv_slot_size, string(_slot_map[? ITEM_MAP.AMOUNT]), c_white, 0.5, noone, _alpha, fa_right, fa_bottom);
		if (_slot_map[? ITEM_MAP.DURABILITY] != noone) { //Durability Bar
			scDrawRect(_xx + 3, _yy + 60, _xx + 61, _yy + 63, c_green, false, _alpha);
		}*/
	}


}
