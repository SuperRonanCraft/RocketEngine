//Drop an item
///@arg item
///@arg x
///@arg y

var _item = argument0;
var _x = argument1;
var _y = argument2;

with (instance_create_depth(_x, _y, depth - 1, oPickupItem)) {
	item_map = _item;
}