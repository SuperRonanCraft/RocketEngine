///@arg x
///@arg y
///@arg alpha
if (!inventory_system) return false;

var _map = inventory_map;

if (scKeybindsGet(KEYBIND_TYPE.INVENTORY)) {
	_map[? INVENTORY_MAP.OPEN] = !_map[? INVENTORY_MAP.OPEN];
	player_map[? PLAYER_MAP.CAN_CONTROL] = !_map[? INVENTORY_MAP.OPEN];
}

var _alpha = argument2;

if (_map[? INVENTORY_MAP.OPEN]) {
	_map[? INVENTORY_MAP.ALPHA] = min(_map[? INVENTORY_MAP.ALPHA] + _map[? INVENTORY_MAP.ALPHA_CHANGE], _alpha);
} else
	_map[? INVENTORY_MAP.ALPHA] = max(_map[? INVENTORY_MAP.ALPHA] - _map[? INVENTORY_MAP.ALPHA_CHANGE], 0);

if (_map[? INVENTORY_MAP.ALPHA] < 0) return false;
var _x = argument0;
var _y = argument1;
_alpha = _map[? INVENTORY_MAP.OPEN] ? _alpha : _map[? INVENTORY_MAP.ALPHA];
	
if (team == TEAM.LEFT)
	_x += 100;
else
	_x = RES_W - (_x + 100);
scDrawSpriteExt(_x, _y, sUIInventory, 0, noone, _alpha);

var _map_slots = _map[? INVENTORY_MAP.SLOT_MAP];
var _height = 3;
for (var i = 0; i < _map[? INVENTORY_MAP.SLOTS]; i++) {
	var _row = i div _height;
	var _xx = (_x - 101 + 3) + ((i - (_row * _height)) * 67);
	var _yy = (_y + 3) + (_row * 67);
	var _map_slot = _map_slots[? i];
	var _item = _map_slot[? SLOT_MAP.ITEM];
	if (_item != ITEM.NONE) {
		var _sprite = _map_slot[? SLOT_MAP.SPRITE];
		scDrawSpriteExt(_xx, _yy, _sprite, 0, noone, _alpha);
	}
}


return true;