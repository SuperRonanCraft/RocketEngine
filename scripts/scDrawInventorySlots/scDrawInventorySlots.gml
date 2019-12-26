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
var _scale = argument7;
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
for (var xx = 0; xx < _width; xx++)
	for (var yy = 0; yy < _height; yy++) {
		var _xx = (_x + _buffer_x) + (xx * _inv_slot_size + (xx * _buffer_x));
		var _yy = (_y + _buffer_y) + (yy * _inv_slot_size + (yy * _buffer_y));
		var _slot_alpha = _alpha;
		var _color = c_white;
		var _slot_map = _grid[# xx, yy];
		var _sprite = sUIInventory, _sprite_index = 0;
		
		if (_inv_hovering != noone && _inv_hovering[0] == xx && _inv_hovering[1] == yy)
			_slot_alpha = 1;
		if (_inv_moving_item != noone)
			if (!scInventorySwapable(_inv_moving_item, _slot_map, inventory_map[? INVENTORY_MAP.MOVING_INV], _inv_type))
				_color = c_red;
			else if (scInventoryStackable(_inv_moving_item, _slot_map))
				_color = c_orange;
		draw_sprite_part_ext(_sprite, _sprite_index, 0, 0, _inv_slot_size, _inv_slot_size, _xx, _yy, 1, 1, _color, _slot_alpha);
	}

//Draw Sprite
for (var xx = 0; xx < _width; xx++)
	for (var yy = 0; yy < _height; yy++) {
		var _slot_map = _grid[# xx, yy];
		//Display item in inventory slot
		if (_slot_map != noone && _slot_map[? ITEM_MAP.ITEM] != ITEM.NONE) { //Display if there is an item in a slot
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
			if (_slot_map[? ITEM_MAP.DURABILITY] != noone) //Durability Bar
				scDrawRect(xx + 3, yy + 60, xx + 61, yy + 63, c_green, false, _alpha / 2);
		}
	}