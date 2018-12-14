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
				if (tile_get_empty(data)) continue; //Skip if already blank
				ds_list_add(tile_hitx, xval);
				ds_list_add(tile_hity, yval);
				ds_list_add(tile_index, index);
				ds_list_add(tile_time, tile_timer);
				tilemap_set_at_pixel(map_id, tile_set_empty(data), xval, yval);
				tilemap_set_at_pixel(tile_map, index, xval, yval);
			}
		}
	}
}