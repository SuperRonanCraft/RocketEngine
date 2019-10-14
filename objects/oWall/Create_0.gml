/// @desc Create tiles

hsp = 0;
vsp = 0;

if (!create_tiles || global.gamemode == GAMEMODE.SINGLE) exit;
var lay_id = layer_get_id("Tiles");
var map_id = layer_tilemap_get_id(lay_id);
for (var xx = 0; xx < image_xscale; xx++)
	for (var yy = 0; yy < image_yscale; yy++)
		tilemap_set(map_id, 1, tilemap_get_cell_x_at_pixel(map_id, x + (32 * xx),
			y + (32 * yy)), tilemap_get_cell_y_at_pixel(map_id, x + (32 * xx), y + (32 * yy)));