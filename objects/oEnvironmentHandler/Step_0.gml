/// @desc progress a tiles hit time

//Not a list cause im lazy
var removing = noone; //Remove the last tile to have a despawn timer
for (var i = 0; i < ds_list_size(tile_hitx); i++) {
	var timer = ds_list_find_value(tile_time, i); //Get the timer
	show_debug_message(string(timer))
	if (timer <= 0) {
		var lay_id = layer_get_id("Tiles");
		var map_id = layer_tilemap_get_id(lay_id);
		var xval =  ds_list_find_value(tile_hitx, i);
		var yval =  ds_list_find_value(tile_hity, i);
		tilemap_set_at_pixel(map_id, ds_list_find_value(tile_index, i), xval, yval);
		tilemap_set_at_pixel(tile_map, 0, xval, yval);
		removing = i;
	} else
		timer--;
	ds_list_set(tile_time, i, timer); //Lower its timer
}

//Remove the list index
if (removing != noone) {
	ds_list_delete(tile_hitx, removing);
	ds_list_delete(tile_hity, removing);
	ds_list_delete(tile_index, removing);
	ds_list_delete(tile_time, removing);
}