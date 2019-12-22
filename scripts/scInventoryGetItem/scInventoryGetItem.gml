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
_map[? ITEM_MAP.SCALE] = 1;
_map[? ITEM_MAP.XX] = 0;
_map[? ITEM_MAP.YY] = 0;

switch (_map[? ITEM_MAP.ITEM]) {
	case ITEM.AXE:
		_map[? ITEM_MAP.AMOUNT] = 1;
		_map[? ITEM_MAP.STACK_MAX] = 1;
		_map[? ITEM_MAP.SPRITE] = sprAxe
		_map[? ITEM_MAP.NAME] = "Axe";
		_map[? ITEM_MAP.ITEM_TYPE] = ITEM_TYPE.TOOL;
		break;
	case ITEM.PICK:
		_map[? ITEM_MAP.AMOUNT] = 1;
		_map[? ITEM_MAP.STACK_MAX] = 1;
		_map[? ITEM_MAP.SPRITE] = sexplosion_Portal;
		_map[? ITEM_MAP.NAME] = "Pickaxe";
		_map[? ITEM_MAP.ITEM_TYPE] = ITEM_TYPE.TOOL;
		break;
	case ITEM.WEAPON_ROCKET:
		_map[? ITEM_MAP.AMOUNT] = 1;
		_map[? ITEM_MAP.STACK_MAX] = 1;
		_map[? ITEM_MAP.SPRITE] = sRocket_Default;
		_map[? ITEM_MAP.NAME] = "Rocket Launcher";
		_map[? ITEM_MAP.ITEM_TYPE] = ITEM_TYPE.WEAPON;
		break;
	case ITEM.WEAPON_SHURIKEN:
		_map[? ITEM_MAP.AMOUNT] = 1;
		_map[? ITEM_MAP.STACK_MAX] = 1;
		_map[? ITEM_MAP.SPRITE] = sShuriken_Default;
		_map[? ITEM_MAP.NAME] = "Shuriken";
		_map[? ITEM_MAP.ITEM_TYPE] = ITEM_TYPE.WEAPON;
		break;
	case ITEM.WEAPON_ARROW:
		_map[? ITEM_MAP.AMOUNT] = 1;
		_map[? ITEM_MAP.STACK_MAX] = 1;
		_map[? ITEM_MAP.SPRITE] = sArrow_default;
		_map[? ITEM_MAP.NAME] = "Bow n' Arrow";
		_map[? ITEM_MAP.ITEM_TYPE] = ITEM_TYPE.WEAPON;
		break;
	case ITEM.ABILITY_PORTAL:
		_map[? ITEM_MAP.AMOUNT] = 10;
		_map[? ITEM_MAP.STACK_MAX] = 16;
		_map[? ITEM_MAP.SPRITE] = sUltPortal;
		_map[? ITEM_MAP.NAME] = "Portal";
		_map[? ITEM_MAP.ITEM_TYPE] = ITEM_TYPE.ABILITY;
		_map[? ITEM_MAP.SCALE] = 0.6;
		break;
	case ITEM.NONE: return noone;
	default: break;
}

_map[? ITEM_MAP.DURABILITY_ORIGINAL] = _map[? ITEM_MAP.DURABILITY];

return _map;

enum ITEM_MAP {
	ITEM, AMOUNT, NAME, ITEM_TYPE,
	STACK_MAX, SPRITE, DURABILITY, DURABILITY_ORIGINAL, MOVING,
	SCALE, XX, YY
	//EVENT_SHOOT, EVENT_USE
}

enum ITEM_TYPE {
	TOOL, CONSUMABLE, WEAPON, ARMOR, ABILITY, NONE
}

enum ITEM {
	WEAPON_ROCKET,
	WEAPON_SHURIKEN,
	WEAPON_ARROW,
	ABILITY_PORTAL,
	AXE,
	PICK,
	//LEAVE LAST
	NONE
}