///@arg item

var _map = ds_map_create();

_map[? SLOT_MAP.ITEM] = argument0;
_map[? SLOT_MAP.AMOUNT] = 1;
_map[? SLOT_MAP.NAME] = "Item";
_map[? SLOT_MAP.MOVING] = false;
_map[? SLOT_MAP.STACK_MAX] = noone;
_map[? SLOT_MAP.SPRITE] = noone;
_map[? SLOT_MAP.DURABILITY] = noone;

switch (_map[? SLOT_MAP.ITEM]) {
	case ITEM.AXE:
		_map[? SLOT_MAP.AMOUNT] = 1;
		_map[? SLOT_MAP.STACK_MAX] = 1;
		_map[? SLOT_MAP.SPRITE] = sprAxe
		_map[? SLOT_MAP.NAME] = "Axe";
		break;
	case ITEM.PICK:
		_map[? SLOT_MAP.AMOUNT] = 1;
		_map[? SLOT_MAP.STACK_MAX] = 1;
		_map[? SLOT_MAP.SPRITE] = sexplosion_Portal;
		_map[? SLOT_MAP.NAME] = "Pickaxe";
		break;
	case ITEM.JUMPPAD:
	default: break;
}

_map[? SLOT_MAP.DURABILITY_ORIGINAL] = _map[? SLOT_MAP.DURABILITY];

return _map;

enum SLOT_MAP {
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