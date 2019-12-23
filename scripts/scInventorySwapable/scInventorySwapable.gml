//@arg grid-from-x
//@arg grid-from-y
//@arg grid-to-x
//@arg grid-to-y
///@arg map_hover
///@arg slot-type

var _map_hover = argument0;//[argument0, argument1];
//var _map_to = argument1;//[argument2, argument3];
var _slot_type = argument1;

///var _map = inventory_map;
//var _inv_grid = _map[? INVENTORY_MAP.GRID];
//var _map_from = _inv_grid[# _inv_swap_from[0], _inv_swap_from[1]];
//var _map_to = _inv_grid[# _inv_swap_to[0], _inv_swap_to[1]];
var _allow_swap = true;

switch (_slot_type) {
	case INVENTORY_SLOT_TYPE.WEAPON:
		_allow_swap = _map_hover[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.WEAPON; break;
	case INVENTORY_SLOT_TYPE.ARMOR:
		_allow_swap = _map_hover[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.ARMOR; break;
	case INVENTORY_SLOT_TYPE.ABILITY:
		_allow_swap = _map_hover[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.ABILITY; break;
	case INVENTORY_SLOT_TYPE.GENERAL:
	default: break;
}

//Restrict items from being placed if bad slots
/*var _slot_from_type = ds_grid_get(_map[? INVENTORY_MAP.GRID_TYPE], _inv_swap_from[0], _inv_swap_from[1]);
var _slot_to_type = ds_grid_get(_map[? INVENTORY_MAP.GRID_TYPE], _inv_swap_to[0], _inv_swap_to[1]);
if (_slot_to_type != _slot_from_type) {
	if (_map_from != noone)
		switch (_slot_to_type) {
			case INVENTORY_SLOT_TYPE.WEAPON:
				_allow_swap_to = _map_from[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.WEAPON; break;
			case INVENTORY_SLOT_TYPE.ARMOR:
				_allow_swap_to = _map_from[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.ARMOR; break;
			case INVENTORY_SLOT_TYPE.ABILITY:
				_allow_swap_to = _map_from[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.ABILITY; break;
			case INVENTORY_SLOT_TYPE.GENERAL:
			default: break;
		}
	if (_map_to != noone)
		switch (_slot_from_type) {
			case INVENTORY_SLOT_TYPE.WEAPON:
				_allow_swap_from = _map_to[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.WEAPON; break;
			case INVENTORY_SLOT_TYPE.ARMOR:
				_allow_swap_from = _map_to[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.ARMOR; break;
			case INVENTORY_SLOT_TYPE.ABILITY:
				_allow_swap_from = _map_to[? ITEM_MAP.ITEM_TYPE] == ITEM_TYPE.ABILITY; break;
			default: break;
		}
}
*/
return _allow_swap;//_to && _allow_swap_from;