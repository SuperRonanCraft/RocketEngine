if (!inventory_system) exit;
inventory_map = ds_map_create();

var _map = inventory_map;
_map[? INVENTORY_MAP.SIZE_ROW_SIZE] = 5;
_map[? INVENTORY_MAP.SIZE_COLUMN_SIZE] = 3;
_map[? INVENTORY_MAP.GRID] = ds_grid_create(_map[? INVENTORY_MAP.SIZE_ROW_SIZE], _map[? INVENTORY_MAP.SIZE_COLUMN_SIZE]);
_map[? INVENTORY_MAP.GRID_TYPE] = ds_grid_create(_map[? INVENTORY_MAP.SIZE_ROW_SIZE], _map[? INVENTORY_MAP.SIZE_COLUMN_SIZE]);
_map[? INVENTORY_MAP.OPEN] = false;
_map[? INVENTORY_MAP.ALPHA] = 0; //Curent inventory alpha
_map[? INVENTORY_MAP.ALPHA_CHANGE] = 0.05; //How much to disappear by
_map[? INVENTORY_MAP.HOTBAR_SELECTED] = 0;
_map[? INVENTORY_MAP.MOVING_MAP] = noone;

//Setup inv slot types
var _grid = _map[? INVENTORY_MAP.GRID_TYPE];
ds_grid_set_region(_grid, 0, 0, _map[? INVENTORY_MAP.SIZE_ROW_SIZE], _map[? INVENTORY_MAP.SIZE_COLUMN_SIZE], INVENTORY_SLOT_TYPE.GENERAL);
ds_grid_set(_grid, 0, _map[? INVENTORY_MAP.SIZE_ROW_SIZE] - 1, INVENTORY_SLOT_TYPE.WEAPON);
ds_grid_set(_grid, 1, _map[? INVENTORY_MAP.SIZE_ROW_SIZE] - 1, INVENTORY_SLOT_TYPE.ARMOR);
ds_grid_set(_grid, 2, _map[? INVENTORY_MAP.SIZE_ROW_SIZE] - 1, INVENTORY_SLOT_TYPE.ABILITY);
//Preset some test items
var _grid = _map[? INVENTORY_MAP.GRID];
ds_grid_set_region(_grid, 0, 0, _map[? INVENTORY_MAP.SIZE_ROW_SIZE], _map[? INVENTORY_MAP.SIZE_COLUMN_SIZE], noone);

for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_ROW_SIZE]; xx++)
	for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_COLUMN_SIZE]; yy++) {
		var _item_map = scInventoryGetItem(irandom_range(ITEM.WEAPON_ROCKET, ITEM.NONE));
		if (_item_map == noone) continue;
		var _item_type = _item_map[? ITEM_MAP.ITEM_TYPE];
		var _slot_type = ds_grid_get(_map[? INVENTORY_MAP.GRID_TYPE], xx, yy);
		if (	_slot_type == INVENTORY_SLOT_TYPE.GENERAL ||
				(_slot_type == INVENTORY_SLOT_TYPE.WEAPON && _item_type == ITEM_TYPE.WEAPON) ||
				(_slot_type == INVENTORY_SLOT_TYPE.ABILITY && _item_type == ITEM_TYPE.ABILITY) ||
				(_slot_type == INVENTORY_SLOT_TYPE.ARMOR && _item_type == ITEM_TYPE.ARMOR))
			_grid[# xx, yy] = _item_map;
		//else
		//	_grid[# xx, yy] = scInventoryGetItem(ITEM.NONE);
	}

enum INVENTORY_MAP {
	SIZE_ROW_SIZE, SIZE_COLUMN_SIZE, GRID, GRID_TYPE, OPEN, ALPHA, ALPHA_CHANGE, SLOT_TYPE,
	HOTBAR_SELECTED, MOVING_MAP
}

enum INVENTORY_SLOT_TYPE {
	GENERAL, WEAPON, ARMOR, ABILITY
}