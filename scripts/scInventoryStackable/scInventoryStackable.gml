///@arg item-1
///@arg item-2

var _map_1 = argument0;
var _map_2 = argument1;
var _can_stack = false;

if (_map_1 != noone && _map_2 != noone)
	if (_map_1[? ITEM_MAP.ITEM] == _map_2[? ITEM_MAP.ITEM]) {
		var _curAmount = _map_1[? ITEM_MAP.AMOUNT];
		var _maxStack = _map_1[? ITEM_MAP.STACK_MAX];
		if (_curAmount < _maxStack)
			_can_stack = true;
	}

return _can_stack;