///Use an item from inventory
///@arg inventory-type
//@arg pressing

if (!system_inventory) exit;

var _inv_type = argument0;
//var _pressing = argument1;

switch (_inv_type) {
	case INVENTORY_TYPE.WEAPON: //WEAPON
		var _grid = inventory_map[? INVENTORY_MAP.GRID_WEAPON];
		var _item_map = _grid[# inventory_map[? INVENTORY_MAP.WEAPON_SELECTED], 0];
		if (_item_map != noone) { //Theres a weapon?
			var _weapon_map = _item_map[? ITEM_MAP.MAP];
			if (_weapon_map != noone) //Weapon has info?
				scWeaponActivate(_weapon_map, false);
		}
		break;
	case INVENTORY_TYPE.GENERAL: //HOTBAR
		break;
	default: break; //Uh, idk why were gonna use anything else tbh
}