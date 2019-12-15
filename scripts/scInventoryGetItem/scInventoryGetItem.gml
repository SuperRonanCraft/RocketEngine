///@arg item

var _map = ds_map_create();

_map[? SLOT_MAP.ITEM] = argument0;
_map[? SLOT_MAP.AMOUNT] = 1;
_map[? SLOT_MAP.STACK_MAX] = noone;
_map[? SLOT_MAP.SPRITE] = noone;

switch (_map[? SLOT_MAP.ITEM]) {
	case ITEM.AXE:
		_map[? SLOT_MAP.AMOUNT] = 1;
		_map[? SLOT_MAP.STACK_MAX] = 8;
		_map[? SLOT_MAP.SPRITE] = sprAxe;
	case ITEM.JUMPPAD:
	default: break;
}

return _map;

enum SLOT_MAP {
	ITEM, AMOUNT, STACK_MAX, SPRITE
}

enum ITEM {
	AXE,
	JUMPPAD,
	//LEAVE LAST
	NONE
}