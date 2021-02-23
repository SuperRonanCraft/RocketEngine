function scInventoryStep() {
	//Inventory weapons n stuff Step Event

	if (!system_inventory) exit;

	for (var i = 0; i < INVENTORY_TYPE.LENGTH; i++)
		switch (i) {
			case INVENTORY_TYPE.WEAPON: //WEAPON
				var _grid = inventory_map[? INVENTORY_MAP.GRID_WEAPON];
				var _item_map = _grid[# inventory_map[? INVENTORY_MAP.WEAPON_SELECTED], 0];
				if (_item_map != noone) { //Theres a weapon?
					var _weapon_map = _item_map[? ITEM_MAP.MAP];
					if (_weapon_map != noone) //Weapon has info?
						scWeaponProgress(_weapon_map);
				}
				break;
			case INVENTORY_TYPE.GENERAL: //HOTBAR
				break;
			default: break; //Uh, idk why were gonna use anything else tbh
		}


}
