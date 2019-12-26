///@arg item-moving
///@arg item-to
///@arg inv-moving
///@arg inv-to

var _map_moving = argument0;
var _map_to = argument1;
var _inv_moving = argument2;
var _inv_to = argument3;

var _allow_swap_moving = true;
var _allow_swap_to = true;
//Restrict items from being placed if bad slots
if (_inv_moving != _inv_to && _inv_to != INVENTORY_TYPE.GENERAL) { //NOT Same inventory
	if (_map_moving != noone)
		switch (_inv_to) {
			case INVENTORY_TYPE.WEAPON:
				_allow_swap_to = _map_moving[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.WEAPON; break;
			case INVENTORY_TYPE.ARMOR:
				_allow_swap_to = _map_moving[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.ARMOR; break;
			case INVENTORY_TYPE.AMMO:
				_allow_swap_to = _map_moving[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.AMMO; break;
			case INVENTORY_TYPE.GENERAL:
			default: break;
		}
	if (_map_to != noone)
		switch (_inv_moving) {
			case INVENTORY_TYPE.WEAPON:
				_allow_swap_moving = _map_to[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.WEAPON; break;
			case INVENTORY_TYPE.ARMOR:
				_allow_swap_moving = _map_to[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.ARMOR; break;
			case INVENTORY_TYPE.AMMO:
				_allow_swap_moving = _map_to[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.AMMO; break;
			default: break;
		}
}

return _allow_swap_moving && _allow_swap_to;
return true;