if (!inventory_system) exit;
inventory_map = ds_map_create();

var _map = inventory_map;
_map[? INVENTORY_MAP.SIZE_ROWS] = 3;
_map[? INVENTORY_MAP.SIZE_COLUMNS] = 3;
_map[? INVENTORY_MAP.GRID] = ds_grid_create(_map[? INVENTORY_MAP.SIZE_ROWS], _map[? INVENTORY_MAP.SIZE_COLUMNS]);
_map[? INVENTORY_MAP.OPEN] = false;
_map[? INVENTORY_MAP.ALPHA] = 0; //Curent inventory alpha
_map[? INVENTORY_MAP.ALPHA_CHANGE] = 0.05; //How much to disappear by
_map[? INVENTORY_MAP.SLOT_MOVING] = [-1, -1]; //Grid id we are moving

//Preset some test items
var _grid = _map[? INVENTORY_MAP.GRID]
for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_ROWS]; xx++) {
	for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_COLUMNS]; yy++) {
		var _slot_map = scInventoryGetItem(choose(ITEM.AXE, ITEM.PICK, ITEM.NONE));
		_grid[# xx, yy] = _slot_map;
	}
}

enum INVENTORY_MAP {
	SIZE_ROWS, SIZE_COLUMNS, GRID, OPEN, ALPHA, ALPHA_CHANGE, SLOT_MOVING
}