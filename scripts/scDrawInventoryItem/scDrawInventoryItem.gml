function scDrawInventoryItem() {
	//Draw inventory item
	///@arg item
	///@arg xx
	///@arg yy
	///@arg slot-size
	///@arg alpha
	///@arg animate
	///@arg update-pos
	///@arg offset-x*
	///@arg offset-y*

	var _slot_map = argument[0];
	var _x = argument[1];
	var _y = argument[2];
	var _inv_slot_size = argument[3];
	var _alpha = argument[4];
	var _animate = argument[5];
	var _update_pos = argument[6];
	var _offset_x = argument_count > 7 ? (argument[7] != noone ? argument[7] : 0) : 0;
	var _offset_y = argument_count > 8 ? (argument[8] != noone ? argument[8] : 0) : 0;

	if (!(_slot_map != noone && _slot_map[? ITEM_MAP.ITEM] != ITEM.NONE)) //Display if there is an item in a slot
		exit;
	var _xx = _animate && _slot_map[? ITEM_MAP.XX] != 0 ? lerp(_slot_map[? ITEM_MAP.XX], _x, 0.1) : _x;
	var _yy = _animate && _slot_map[? ITEM_MAP.YY] != 0 ? lerp(_slot_map[? ITEM_MAP.YY], _y, 0.1) : _y;
	if (_update_pos) {
		_slot_map[? ITEM_MAP.XX] = _xx;
		_slot_map[? ITEM_MAP.YY] = _yy;
	}
	var _sprite = _slot_map[? ITEM_MAP.SPRITE];
	var _scale = _slot_map[? ITEM_MAP.SCALE] + (_slot_map[? ITEM_MAP.SCALE_ANIM] * _slot_map[? ITEM_MAP.SCALE]);
	_slot_map[? ITEM_MAP.SCALE_ANIM] = max(_slot_map[? ITEM_MAP.SCALE_ANIM] - 0.03, 0);
	var _item_w = sprite_get_width(_sprite);
	var _item_h = sprite_get_height(_sprite);
	_xx += _offset_x;
	_yy += _offset_y;
	draw_sprite_part_ext(
		_sprite, 0, 0, 0, _item_w, _item_h, _xx + (_inv_slot_size / 2) - ((_item_w * _scale) / 2),
		_yy + (_inv_slot_size / 2) - ((_item_h * _scale) / 2), _scale, _scale, c_white, _alpha);
	//scDrawSpriteExt(_xx, _yy, _sprite, 0, noone, _alpha);
	if (_slot_map[? ITEM_MAP.AMOUNT] > 1) { //Amount if above 1
		var _c = _slot_map[? ITEM_MAP.AMOUNT] >= _slot_map[? ITEM_MAP.STACK_MAX] ? c_yellow : c_white;
		scDrawText(_xx + _inv_slot_size, _yy + _inv_slot_size, string(_slot_map[? ITEM_MAP.AMOUNT]), _c, 0.5, noone, _alpha, fa_right, fa_bottom);
	}
	if (_slot_map[? ITEM_MAP.DURABILITY] != noone) //Durability Bar
		scDrawRect(_xx + 3, _yy + 60, _xx + 61, _yy + 63, c_green, false, _alpha);


}
