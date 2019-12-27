///@arg grid
///@arg item

var _grid = argument0;
var _item = argument1; //Find a slot that an item can stack into

//Can we stack?
for (var xx = 0; xx < ds_grid_width(_grid); xx++)
	for (var yy = 0; yy < ds_grid_height(_grid); yy++)
		if (_grid[# xx, yy] != noone)
			if (scInventoryStackable(_grid[# xx, yy], _item))
				return [xx, yy];

//Can we just go into the inventory?
if (ds_grid_value_exists(_grid, 0, 0, ds_grid_width(_grid) - 1, ds_grid_height(_grid), noone)) { //Empty slot available
	for (var xx = 0; xx < ds_grid_width(_grid); xx++)
		for (var yy = 0; yy < ds_grid_height(_grid); yy++)
			if (_grid[# xx, yy] == noone)
				return [xx, yy];
}
return noone;