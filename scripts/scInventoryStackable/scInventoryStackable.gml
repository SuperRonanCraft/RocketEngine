//@arg grid-x1
//@arg grid-y1
//@arg grid-x2
//@arg grid-y2
///@arg map_from
///@arg map-to

var _map_1 = argument0;//[argument0, argument1];
var _map_2 = argument1;//[argument2, argument3];

//var _map = inventory_map;
//var _inv_grid = _map[? INVENTORY_MAP.GRID];
//var _map_1 = _inv_grid[# _inv_item_1[0], _inv_item_1[1]];
//var _map_2 = _inv_grid[# _inv_item_2[0], _inv_item_2[1]];
var _can_stack = false;

if (_map_1 != noone && _map_2 != noone)
	if (_map_1[? ITEM_MAP.ITEM] == _map_2[? ITEM_MAP.ITEM]) {
		var _curAmount = _map_1[? ITEM_MAP.AMOUNT];
		var _maxStack = _map_1[? ITEM_MAP.STACK_MAX];
		if (_curAmount < _maxStack)
			_can_stack = true;
	}

return _can_stack;