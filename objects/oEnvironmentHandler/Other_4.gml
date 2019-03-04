/// @desc start a hit list

tile_layer = layer_create(100);
tile_map = layer_tilemap_create(tile_layer, 0, 0, tileset, room_width, room_height);

tile_list = ds_list_create();