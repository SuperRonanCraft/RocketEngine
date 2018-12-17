/// @desc progress a tiles hit time

var index = 0; //The current list index, not the current id
for (var i = index; i < ds_list_size(tile_list); i++) {
	var map = tile_list[| index];
	var timer = map[? "timer"]; //Get the timer
	if (timer <= 0) {
		var lay_id = layer_get_id("Tiles");
		var map_id = layer_tilemap_get_id(lay_id);
		var mx = map[? "x"];
		var my = map[? "y"];
		//Set the tile back to normal
		tilemap_set(map_id, map[? "index"], mx, my); //Normal tilemap
		tilemap_set(tile_map, 0, mx, my); //Damage tilemap
		ds_map_destroy(map); //Delete the map from memory
		ds_list_delete(tile_list, index); //Remove the tile from the list
	} else {
		map[? "timer"] = timer - 1; //Lower the timer
		index++;
	}
}