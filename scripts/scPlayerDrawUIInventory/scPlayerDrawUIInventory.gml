///@arg x
///@arg y
///@arg alpha
if (!inventory_system) return false;

var _map = inventory_map;

if (scKeybindsGet(KEYBIND.INVENTORY)) {
	_map[? INVENTORY_MAP.OPEN] = !_map[? INVENTORY_MAP.OPEN];
	global.play = !_map[? INVENTORY_MAP.OPEN];
	if (_map[? INVENTORY_MAP.OPEN])
		SlideTransition(TRANS_MODE.PAUSE);
	else
		SlideTransition(TRANS_MODE.UNPAUSE);
	//player_map[? PLAYER_MAP.CAN_CONTROL] = !_map[? INVENTORY_MAP.OPEN];
	//Safety
	if (!_map[? INVENTORY_MAP.OPEN]) { //Put item back if moving
		var _inv_grid = _map[? INVENTORY_MAP.GRID];
		for (var xx = 0; xx < _map[? INVENTORY_MAP.SIZE_ROWS]; xx++)
			for (var yy = 0; yy < _map[? INVENTORY_MAP.SIZE_COLUMNS]; yy++) {
				var _slot_map = _inv_grid[# xx, yy];
				if (_slot_map != noone) {
					if (_slot_map[? ITEM_MAP.MOVING])
						_slot_map[? ITEM_MAP.MOVING] = false;
					_slot_map[? ITEM_MAP.XX] = 0;
					_slot_map[? ITEM_MAP.YY] = 0;
				}
			}
	}
}

var _x = argument0;
var _y = argument1;
var _alpha = argument2;

scPlayerDrawUIInventoryHotbar(_x, _y, _alpha);

if (_map[? INVENTORY_MAP.OPEN]) {
	_map[? INVENTORY_MAP.ALPHA] = min(_map[? INVENTORY_MAP.ALPHA] + _map[? INVENTORY_MAP.ALPHA_CHANGE], _alpha);
} else
	_map[? INVENTORY_MAP.ALPHA] = max(_map[? INVENTORY_MAP.ALPHA] - _map[? INVENTORY_MAP.ALPHA_CHANGE], 0);

if (_map[? INVENTORY_MAP.ALPHA] <= 0) return false;
_alpha = _map[? INVENTORY_MAP.OPEN] ? _alpha : _map[? INVENTORY_MAP.ALPHA];

//scPlayerDrawUIInventoryScreen(_x, _y, _alpha);
return true;