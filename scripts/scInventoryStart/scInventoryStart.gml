if (!inventory_system) exit;
inventory_map = ds_map_create();

var _map = inventory_map;
_map[? INVENTORY_MAP.SLOTS] = 9;
_map[? INVENTORY_MAP.OPEN] = false;
_map[? INVENTORY_MAP.ALPHA] = 0;
_map[? INVENTORY_MAP.ALPHA_CHANGE] = 0.05;
_map[? INVENTORY_MAP.SLOT_MAP] = ds_map_create();
for (var i = 0; i < _map[? INVENTORY_MAP.SLOTS]; i++) {
	var _slot_map = scInventoryGetItem(choose(ITEM.AXE, ITEM.NONE));
	ds_map_set(_map[? INVENTORY_MAP.SLOT_MAP], i, _slot_map);
}

enum INVENTORY_MAP {
	SLOTS, SLOT_MAP, OPEN, ALPHA, ALPHA_CHANGE
}