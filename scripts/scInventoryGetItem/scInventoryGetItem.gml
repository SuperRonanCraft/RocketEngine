///@arg item

var _map = ds_map_create();

_map[? ITEM_MAP.ITEM] = argument0;
_map[? ITEM_MAP.AMOUNT] = 1;
_map[? ITEM_MAP.NAME] = "Item";
_map[? ITEM_MAP.MOVING] = false;
_map[? ITEM_MAP.STACK_MAX] = noone;
_map[? ITEM_MAP.SPRITE] = noone;
_map[? ITEM_MAP.DURABILITY] = noone;

switch (_map[? ITEM_MAP.ITEM]) {
	case ITEM.AXE:
		_map[? ITEM_MAP.AMOUNT] = 1;
		_map[? ITEM_MAP.STACK_MAX] = 1;
		_map[? ITEM_MAP.SPRITE] = sprAxe
		_map[? ITEM_MAP.NAME] = "Axe";
		break;
	case ITEM.PICK:
		_map[? ITEM_MAP.AMOUNT] = 1;
		_map[? ITEM_MAP.STACK_MAX] = 1;
		_map[? ITEM_MAP.SPRITE] = sexplosion_Portal;
		_map[? ITEM_MAP.NAME] = "Pickaxe";
		break;
	case ITEM.JUMPPAD:
	default: break;
}

_map[? ITEM_MAP.DURABILITY_ORIGINAL] = _map[? ITEM_MAP.DURABILITY];

return _map;

enum ITEM_MAP {
	ITEM, AMOUNT, NAME, 
	STACK_MAX, SPRITE, DURABILITY, DURABILITY_ORIGINAL, MOVING
}

enum ITEM {
	AXE,
	JUMPPAD,
	PICK,
	//LEAVE LAST
	NONE
}