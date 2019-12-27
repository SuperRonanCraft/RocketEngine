///Pickup item
///@arg item

var _item = argument0;

if (_item != noone) {
	var _grid = noone;
	var _item_type = _item[? ITEM_MAP.ITEM_TYPE];
	switch (_item_type) {
		case ITEM_TYPE.WEAPON: 
			_grid = inventory_map[? INVENTORY_MAP.GRID_WEAPON]; break;
		case ITEM_TYPE.ARMOR: 
			_grid = inventory_map[? INVENTORY_MAP.GRID_ARMOR]; break;
		case ITEM_TYPE.AMMO: 
			_grid = inventory_map[? INVENTORY_MAP.GRID_AMMO]; break;
		default:
			_grid = inventory_map[? INVENTORY_MAP.GRID_GENERAL]; break;
	}
	
	if (_grid != inventory_map[? INVENTORY_MAP.GRID_GENERAL]) {
		var _slots = scItemFindSlot(_grid, _item);
		if (_slots != noone) {
			if (_grid[# _slots[0], _slots[1]] == noone) { //Just add the item to the inventory
				_item[? ITEM_MAP.XX] = 0;
				_item[? ITEM_MAP.YY] = 0;
				_item[? ITEM_MAP.SCALE_ANIM] = 0.5;
				_grid[# _slots[0], _slots[1]] = _item;
				_item = noone;
			} else { //We are gonna have to stack this item in
				var _item_inv = _grid[# _slots[0], _slots[1]];
				while (_item[? ITEM_MAP.AMOUNT] > 0 && _item_inv[? ITEM_MAP.AMOUNT] < _item_inv[? ITEM_MAP.STACK_MAX]) {
					_item[? ITEM_MAP.AMOUNT]--;
					_item_inv[? ITEM_MAP.AMOUNT]++;
				}
			}
		}
	} 
	if (_item != noone && _item[? ITEM_MAP.AMOUNT] > 0) {
		//Last inventory was full, lets go into the general inventory
		_grid = inventory_map[? INVENTORY_MAP.GRID_GENERAL];
		var _slots = scItemFindSlot(_grid, _item);
		if (_slots != noone) {
			if (_grid[# _slots[0], _slots[1]] == noone) { //Just add the item to the inventory
				_item[? ITEM_MAP.XX] = 0;
				_item[? ITEM_MAP.YY] = 0;
				_item[? ITEM_MAP.SCALE_ANIM] = 0.5;
				_grid[# _slots[0], _slots[1]] = _item;
				_item = noone;
			} else { //We are gonna have to stack this item in
				var _item_inv = _grid[# _slots[0], _slots[1]];
				while (_item[? ITEM_MAP.AMOUNT] > 0 && _item_inv[? ITEM_MAP.AMOUNT] < _item_inv[? ITEM_MAP.STACK_MAX]) {
					_item[? ITEM_MAP.AMOUNT]--;
					_item_inv[? ITEM_MAP.AMOUNT]++;
				}
			}
			if (_item != noone && _item[? ITEM_MAP.AMOUNT] > 0) { //Extra items, lets try to fill up our inventory!
				for (var xx = 0; xx < ds_grid_width(_grid) - 1; xx++) {
					if (_item[? ITEM_MAP.AMOUNT] <= 0)
							break;
					for (var yy = 0; yy < ds_grid_height(_grid) - 1; yy++) {
						if (_item[? ITEM_MAP.AMOUNT] <= 0)
							break;
						var _item_slot = _grid[# xx, yy];
						if (scInventoryStackable(_item_slot, _item)) {
							while (_item[? ITEM_MAP.AMOUNT] > 0 && _item_inv[? ITEM_MAP.AMOUNT] < _item_inv[? ITEM_MAP.STACK_MAX]) {
								_item[? ITEM_MAP.AMOUNT]--;
								_item_slot[? ITEM_MAP.AMOUNT]++;
							}
						}
					}
				}
			}
		}
	}
}

return _item;