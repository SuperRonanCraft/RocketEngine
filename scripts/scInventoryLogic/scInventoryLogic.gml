//Inventory logic (item swapping)

var _map = inventory_map;
var _moving_item = _map[? INVENTORY_MAP.MOVING_ITEM];
var _hovering_slot = _map[? INVENTORY_MAP.HOVERING_SLOT];
var _hovering_inv = _map[? INVENTORY_MAP.HOVERING_INV];
if (_hovering_slot != noone) { //We are hovering over an item
	var _grid = noone;
	switch (_hovering_inv) {
		case INVENTORY_TYPE.GENERAL:
			_grid = _map[? INVENTORY_MAP.GRID_GENERAL]; break;
		case INVENTORY_TYPE.WEAPON:
			_grid = _map[? INVENTORY_MAP.GRID_WEAPON]; break;
		case INVENTORY_TYPE.AMMO:
			_grid = _map[? INVENTORY_MAP.GRID_AMMO]; break;
		case INVENTORY_TYPE.ARMOR:
			_grid = _map[? INVENTORY_MAP.GRID_ARMOR]; break;
	}
	var _hov_map = _grid[# _hovering_slot[0], _hovering_slot[1]]; //Hovering item
	if (mouse_check_button_pressed(mb_left)) {
		if (_moving_item == noone) { //Not moving an item, just pick it up
			_map[? INVENTORY_MAP.MOVING_ITEM] = _hov_map;
			_map[? INVENTORY_MAP.MOVING_SLOT] = _hovering_slot;
			_map[? INVENTORY_MAP.MOVING_INV] = _hovering_inv;
			_grid[# _hovering_slot[0], _hovering_slot[1]] = noone;
		} else { //We have an item in our mouse
			if (scInventoryStackable(_hov_map, _moving_item)) { //Can they stack
				//var _map_1 = _inv_grid[# _inv_swap_from[0], _inv_swap_from[1]];
				var _curAmount_1 = _moving_item[? ITEM_MAP.AMOUNT];
				var _curAmount_2 = _hov_map[? ITEM_MAP.AMOUNT];
				var _maxStack = _hov_map[? ITEM_MAP.STACK_MAX];
				if (_curAmount_1 + _curAmount_2 <= _maxStack) { //One stack can fit into another
					_hov_map[? ITEM_MAP.AMOUNT] += _moving_item[? ITEM_MAP.AMOUNT];
					_map[? INVENTORY_MAP.MOVING_ITEM] = noone;
					_map[? INVENTORY_MAP.MOVING_SLOT] = noone;
					_map[? INVENTORY_MAP.MOVING_INV] = noone;
				} else { //Too many items to fit in one stack
					var _dif = _maxStack - _curAmount_2;
					if (_dif != 0) {
						_hov_map[? ITEM_MAP.AMOUNT] -= -_dif;
						_moving_item[? ITEM_MAP.AMOUNT] += -_dif;
					} else {
						
					}
				}
			} else if (scInventorySwapable(_moving_item, _hov_map, _map[? INVENTORY_MAP.MOVING_INV], _hovering_inv)) { //Can they swap?
				_map[? INVENTORY_MAP.MOVING_ITEM] = _hov_map;
				_map[? INVENTORY_MAP.MOVING_SLOT] = _hovering_slot;
				_map[? INVENTORY_MAP.MOVING_INV] = _hovering_inv;
				_grid[# _hovering_slot[0], _hovering_slot[1]] = _moving_item;
			}
		}
	}
}

_map[? INVENTORY_MAP.HOVERING_SLOT] = noone;
_map[? INVENTORY_MAP.HOVERING_INV] = noone;