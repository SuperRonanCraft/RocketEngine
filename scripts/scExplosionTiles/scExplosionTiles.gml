/// @desc lets damage the environment related to objects bbox and sprite width

var lay_id = layer_get_id("Tiles");
var map_id = layer_tilemap_get_id(lay_id);
var tile_h = tilemap_get_tile_height(map_id);
var tile_l = tilemap_get_tile_width(map_id);
var h = round(sprite_height / tile_h);
var l = round(sprite_width / tile_l);
var xx = bbox_left;
var yy = bbox_top;
//Iterate through every tile
for (var hei = 0; hei < h; hei++) {
	var yval = yy + (tile_h * hei);
	for (var len = 0; len < l; len++) {
		var xval = xx + (tile_l * len);
		if (collision_point(xval, yval, oWall, false, true)) {
			with (oEnvironmentHandler) {
				var mx = tilemap_get_cell_x_at_pixel(map_id, xval, yval);
				var my = tilemap_get_cell_y_at_pixel(map_id, xval, yval);
				var data = tilemap_get(map_id, mx, my);
				var index = tile_get_index(data);
				if (tile_get_empty(data)) { //Skip if already blank
					for (var i = 0; i < ds_list_size(tile_list); i++) {
						var map = tile_list[| i]
						if (map[? "x"] == mx && map[? "y"] == my) {
							map[? "timer"] = tile_timer + irandom_range(tile_timer_randomize, -tile_timer_randomize); break;
						}
					}
				} else {
					var map = ds_map_create();
					ds_map_add(map, "x", mx);
					ds_map_add(map, "y", my);
					ds_map_add(map, "index", index);
					ds_map_add(map, "timer", tile_timer + irandom_range(tile_timer_randomize, -tile_timer_randomize));
					ds_list_add(tile_list, map);
					tilemap_set(map_id, tile_set_empty(data), mx, my);
					tilemap_set(tile_map, index, mx, my);
				}
			}
		}
	}
}