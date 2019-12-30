if (!system_inventory) exit;
inventory_map = ds_map_create();

var _map = inventory_map;
_map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH] = 5;
_map[? INVENTORY_MAP.SIZE_GENERAL_HEIGHT] = 3;
_map[? INVENTORY_MAP.SIZE_WEAPON_WIDTH] = 2;
_map[? INVENTORY_MAP.SIZE_WEAPON_HEIGHT] = 1;
_map[? INVENTORY_MAP.SIZE_AMMO_WIDTH] = AMMO_TYPE.LENGTH;
_map[? INVENTORY_MAP.SIZE_AMMO_HEIGHT] = 1;
_map[? INVENTORY_MAP.SIZE_ARMOR_WIDTH] = 1;
_map[? INVENTORY_MAP.SIZE_ARMOR_HEIGHT] = 1;
_map[? INVENTORY_MAP.GRID_GENERAL] = ds_grid_create(_map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH], _map[? INVENTORY_MAP.SIZE_GENERAL_HEIGHT]);
_map[? INVENTORY_MAP.GRID_WEAPON] = ds_grid_create(_map[? INVENTORY_MAP.SIZE_WEAPON_WIDTH], _map[? INVENTORY_MAP.SIZE_WEAPON_HEIGHT]);
_map[? INVENTORY_MAP.GRID_AMMO] = ds_grid_create(_map[? INVENTORY_MAP.SIZE_AMMO_WIDTH], _map[? INVENTORY_MAP.SIZE_AMMO_HEIGHT]);
_map[? INVENTORY_MAP.GRID_ARMOR] = ds_grid_create(_map[? INVENTORY_MAP.SIZE_ARMOR_WIDTH], _map[? INVENTORY_MAP.SIZE_ARMOR_HEIGHT]);
//_map[? INVENTORY_MAP.GRID_TYPE] = ds_grid_create(_map[? INVENTORY_MAP.SIZE_ROW_SIZE], _map[? INVENTORY_MAP.SIZE_COLUMN_SIZE]);
_map[? INVENTORY_MAP.OPEN] = false;
_map[? INVENTORY_MAP.ALPHA] = 0; //Curent inventory alpha
_map[? INVENTORY_MAP.ALPHA_CHANGE] = 0.05; //How much to disappear by
_map[? INVENTORY_MAP.HOTBAR_SELECTED] = 0;
_map[? INVENTORY_MAP.WEAPON_SELECTED] = 0;
_map[? INVENTORY_MAP.MOVING_ITEM] = noone;
_map[? INVENTORY_MAP.MOVING_SLOT] = noone;
_map[? INVENTORY_MAP.MOVING_INV] = noone;
_map[? INVENTORY_MAP.HOVERING_SLOT] = noone;
_map[? INVENTORY_MAP.HOVERING_INV] = noone;

//Setup inv slot types
/*var _grid = _map[? INVENTORY_MAP.GRID_TYPE];
ds_grid_set_region(_grid, 0, 0, _map[? INVENTORY_MAP.SIZE_GENERAL_ROW], _map[? INVENTORY_MAP.SIZE_GENERAL_COLUMN], INVENTORY_SLOT_TYPE.GENERAL);
ds_grid_set(_grid, 0, _map[? INVENTORY_MAP.SIZE_GENERAL_ROW] - 1, INVENTORY_SLOT_TYPE.WEAPON);
ds_grid_set(_grid, 1, _map[? INVENTORY_MAP.SIZE_GENERAL_ROW] - 1, INVENTORY_SLOT_TYPE.ARMOR);
ds_grid_set(_grid, 2, _map[? INVENTORY_MAP.SIZE_GENERAL_ROW] - 1, INVENTORY_SLOT_TYPE.ABILITY);*/
//Preset some test items
ds_grid_set_region(_map[? INVENTORY_MAP.GRID_GENERAL], 0, 0, _map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH] - 1, _map[? INVENTORY_MAP.SIZE_GENERAL_HEIGHT] - 1, noone);
ds_grid_set_region(_map[? INVENTORY_MAP.GRID_WEAPON], 0, 0, _map[? INVENTORY_MAP.SIZE_WEAPON_WIDTH] - 1, _map[? INVENTORY_MAP.SIZE_WEAPON_HEIGHT] - 1, noone);
ds_grid_set_region(_map[? INVENTORY_MAP.GRID_AMMO], 0, 0, _map[? INVENTORY_MAP.SIZE_AMMO_WIDTH] - 1, _map[? INVENTORY_MAP.SIZE_AMMO_HEIGHT] - 1, noone);
ds_grid_set_region(_map[? INVENTORY_MAP.GRID_ARMOR], 0, 0, _map[? INVENTORY_MAP.SIZE_ARMOR_WIDTH] - 1, _map[? INVENTORY_MAP.SIZE_ARMOR_HEIGHT] - 1, noone);

var _grid = _map[? INVENTORY_MAP.GRID_GENERAL];
for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH]; xx++)
	for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_GENERAL_HEIGHT]; yy++) {
		var _item_map = scInventoryGetItem(irandom_range(ITEM.WEAPON_ROCKET, ITEM.NONE - 1));
		if (_item_map == noone) continue;
		//var _item_type = _item_map[? ITEM_MAP.ITEM_TYPE];
		//var _slot_type = ds_grid_get(_map[? INVENTORY_MAP.GRID_TYPE], xx, yy);
		//if (	_slot_type == INVENTORY_SLOT_TYPE.GENERAL ||
		//		(_slot_type == INVENTORY_SLOT_TYPE.WEAPON && _item_type == ITEM_TYPE.WEAPON) ||
				//(_slot_type == INVENTORY_SLOT_TYPE.ABILITY && _item_type == ITEM_TYPE.ABILITY) ||
		//		(_slot_type == INVENTORY_SLOT_TYPE.ARMOR && _item_type == ITEM_TYPE.ARMOR))
		_grid[# xx, yy] = _item_map;
		//else
		//	_grid[# xx, yy] = scInventoryGetItem(ITEM.NONE);
	}

enum INVENTORY_MAP {
	//Size types
	SIZE_GENERAL_WIDTH, SIZE_GENERAL_HEIGHT,
	SIZE_WEAPON_WIDTH, SIZE_WEAPON_HEIGHT,
	SIZE_AMMO_WIDTH, SIZE_AMMO_HEIGHT,
	SIZE_ARMOR_WIDTH, SIZE_ARMOR_HEIGHT,
	GRID_GENERAL, GRID_WEAPON, GRID_AMMO, GRID_ARMOR, 
	OPEN, ALPHA, ALPHA_CHANGE,
	HOTBAR_SELECTED, WEAPON_SELECTED,
	MOVING_ITEM, MOVING_SLOT, MOVING_INV, //Moving item stuff
	HOVERING_SLOT, HOVERING_INV
}

enum INVENTORY_TYPE {
	GENERAL, WEAPON, AMMO, ARMOR, LENGTH//, ABILITY
}

enum AMMO_TYPE {
	ROCKET, ARROW, LENGTH
}