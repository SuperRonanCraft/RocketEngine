///@arg item

var _map = ds_map_create();

_map[? ITEM_MAP.ITEM] = argument0;
_map[? ITEM_MAP.AMOUNT] = 1;
_map[? ITEM_MAP.NAME] = "Item";
_map[? ITEM_MAP.ITEM_TYPE] = ITEM_TYPE.NONE;
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
	case ITEM.WEAPON_ROCKET:
		_map[? ITEM_MAP.AMOUNT] = 1;
		_map[? ITEM_MAP.STACK_MAX] = 1;
		_map[? ITEM_MAP.SPRITE] = sRocket_Default;
		_map[? ITEM_MAP.NAME] = "Rocket Launcher";
		break;
	case ITEM.WEAPON_SHURIKEN:
		_map[? ITEM_MAP.AMOUNT] = 1;
		_map[? ITEM_MAP.STACK_MAX] = 1;
		_map[? ITEM_MAP.SPRITE] = sShuriken_Default;
		_map[? ITEM_MAP.NAME] = "Shuriken";
		break;
	case ITEM.WEAPON_ARROW:
		_map[? ITEM_MAP.AMOUNT] = 1;
		_map[? ITEM_MAP.STACK_MAX] = 1;
		_map[? ITEM_MAP.SPRITE] = sArrow_default;
		_map[? ITEM_MAP.NAME] = "Bow n' Arrow";
		break;
	default: break;
}

_map[? ITEM_MAP.DURABILITY_ORIGINAL] = _map[? ITEM_MAP.DURABILITY];

return _map;

enum ITEM_MAP {
	ITEM, AMOUNT, NAME, ITEM_TYPE,
	STACK_MAX, SPRITE, DURABILITY, DURABILITY_ORIGINAL, MOVING,
	//EVENT_SHOOT, EVENT_USE
}

enum ITEM_TYPE {
	WEAPON, ARMOR, CONSUMABLE, NONE
}

enum ITEM {
	WEAPON_ROCKET,
	WEAPON_SHURIKEN,
	WEAPON_ARROW,
	AXE,
	PICK,
	//LEAVE LAST
	NONE
}