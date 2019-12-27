//Draw Inventory script
///@arg x
///@arg y
///@arg alpha
if (!system_inventory) return false;

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
		var _moving_item = _map[? INVENTORY_MAP.MOVING_ITEM];
		if (_moving_item != noone) {
			_moving_item[? ITEM_MAP.XX] = 0;
			_moving_item[? ITEM_MAP.YY] = 0;
			var _moving_slot = _map[? INVENTORY_MAP.MOVING_SLOT]; //Original moving slot, incase we need to drop
			var _moving_inv = _map[? INVENTORY_MAP.MOVING_INV];
			var _grid = noone;
			switch (_moving_inv) {
				case INVENTORY_TYPE.GENERAL:
					_grid = _map[? INVENTORY_MAP.GRID_GENERAL]; break;
				case INVENTORY_TYPE.WEAPON:
					_grid = _map[? INVENTORY_MAP.GRID_WEAPON]; break;
				case INVENTORY_TYPE.AMMO:
					_grid = _map[? INVENTORY_MAP.GRID_AMMO]; break;
				case INVENTORY_TYPE.ARMOR:
					_grid = _map[? INVENTORY_MAP.GRID_ARMOR]; break;
			}
			var _slot_map = _grid[# _moving_slot[0], _moving_slot[1]];
			if (_slot_map == noone) { //Safe to put back in old slot
				_grid[# _moving_slot[0], _moving_slot[1]] = _moving_item;
			} else if (ds_grid_value_exists(_grid, 0, 0, ds_grid_width(_grid) - 1, ds_grid_height(_grid), noone)) { //Empty slot available
				var _found = false;
				for (var xx = 0; xx < ds_grid_width(_grid); xx++)
					if (!_found) {
						for (var yy = 0; yy < ds_grid_height(_grid); yy++)
							if (_grid[# xx, yy] == noone) {
								_grid[# xx, yy] = _moving_item;
								_found = true;
								break;
							}
					} else break;
			} else //Seems like we are full! We should drop this item!
				scItemDrop(_slot_map, x, y);
			_map[? INVENTORY_MAP.MOVING_ITEM] = noone;
			_map[? INVENTORY_MAP.MOVING_SLOT] = noone;
			_map[? INVENTORY_MAP.MOVING_INV] = noone;
		}
	}
}

var _x = argument0;
var _y = argument1;
var _alpha = argument2;

if (_alpha - _map[? INVENTORY_MAP.ALPHA] > 0)
	scDrawInventoryHotbar(_x, _y, _alpha - _map[? INVENTORY_MAP.ALPHA]);

if (_map[? INVENTORY_MAP.OPEN]) {
	_map[? INVENTORY_MAP.ALPHA] = min(_map[? INVENTORY_MAP.ALPHA] + _map[? INVENTORY_MAP.ALPHA_CHANGE], _alpha);
} else
	_map[? INVENTORY_MAP.ALPHA] = max(_map[? INVENTORY_MAP.ALPHA] - _map[? INVENTORY_MAP.ALPHA_CHANGE], 0);

if (_map[? INVENTORY_MAP.ALPHA] <= 0) return false;
_alpha = _map[? INVENTORY_MAP.OPEN] ? _alpha : _map[? INVENTORY_MAP.ALPHA];

var _slot_size = 70;
var _buffer_x = 16; //Distance between inventory slots (x)
var _buffer_y = 16; //Distance between inventory slots (y)

var _centerx = (RES_W / 2);
var _centery = (RES_H / 2);

var _x = _centerx - ((_map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH]) * _slot_size) - (_buffer_x * (_map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH] + 1));
var _y = _centery - (((_map[? INVENTORY_MAP.SIZE_GENERAL_HEIGHT] / 2)) * _slot_size) - (_buffer_y * ((_map[? INVENTORY_MAP.SIZE_GENERAL_HEIGHT] + 1) / 2));

//DRAW BACKGROUND
//
//USE _x and _y to center on top left of general inventory, or centerx and centery to center on screen
//scDrawSpriteExt(_centerx, _centery, /*YOUR SPRITE JOHN*/, 0);
//
//DRAW BACKGROUND

for (var i = 0; i < INVENTORY_TYPE.LENGTH; i++) {
	switch (i) {
		case INVENTORY_TYPE.GENERAL:
			scDrawInventorySlots(_map[? INVENTORY_MAP.GRID_GENERAL], _map[? INVENTORY_MAP.SIZE_GENERAL_WIDTH], _map[? INVENTORY_MAP.SIZE_GENERAL_HEIGHT],
				_x, _y, _alpha, _slot_size, 1, _buffer_x, _buffer_y, i);
			break;
		case INVENTORY_TYPE.WEAPON:
			var _x_ = _centerx + _buffer_x; //((_map[? INVENTORY_MAP.SIZE_WEAPON_WIDTH]) * _slot_size) - (_buffer_x * (_map[? INVENTORY_MAP.SIZE_WEAPON_WIDTH] + 1));
			var _y_ = _y;
			scDrawInventorySlots(_map[? INVENTORY_MAP.GRID_WEAPON], _map[? INVENTORY_MAP.SIZE_WEAPON_WIDTH], _map[? INVENTORY_MAP.SIZE_WEAPON_HEIGHT],
				_x_, _y_, _alpha, _slot_size, 1.4, _buffer_x, _buffer_y, i);
			break;
		case INVENTORY_TYPE.AMMO:
			var _x_ = _centerx + _buffer_x;
			var _y_ = _centery + ((((_map[? INVENTORY_MAP.SIZE_GENERAL_HEIGHT] - 1) / 2)) * _slot_size) - (_buffer_y * ((_map[? INVENTORY_MAP.SIZE_GENERAL_HEIGHT] + 1) / 2));
			scDrawInventorySlots(_map[? INVENTORY_MAP.GRID_AMMO], _map[? INVENTORY_MAP.SIZE_AMMO_WIDTH], _map[? INVENTORY_MAP.SIZE_AMMO_HEIGHT],
				_x_, _y_, _alpha, _slot_size, 0.8, _buffer_x, _buffer_y, i);
			break;
		case INVENTORY_TYPE.ARMOR:
			var _x_ = _centerx + (_buffer_x * 1.5) + (_slot_size / 2);
			var _y_ = _centery - (_slot_size / 2) - _buffer_x;
			scDrawInventorySlots(_map[? INVENTORY_MAP.GRID_ARMOR], _map[? INVENTORY_MAP.SIZE_ARMOR_WIDTH], _map[? INVENTORY_MAP.SIZE_ARMOR_HEIGHT],
				_x_, _y_, _alpha, _slot_size, 1, _buffer_x, _buffer_y, i);
			break;
	}
}

var _x = _centerx + (_buffer_x * 3) + (_slot_size * (_map[? INVENTORY_MAP.SIZE_WEAPON_WIDTH] + 1));
var _y = _centery;
var _img = floor(player_map[? PLAYER_MAP.ANIMATION_VAR]);
scDrawSpriteExt(_x, _y, player_map[? PLAYER_MAP.CURRENT_SPRITE], _img, noone, _alpha, 2, 2);

scDrawInventoryTipOrMoving(_slot_size, _alpha);
scInventoryLogic(); //Inventory swapping stuff

return true;