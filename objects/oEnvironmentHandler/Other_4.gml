/// @desc start a hit list

tile_layer = layer_create(-1);
tile_map = layer_tilemap_create(tile_layer, 0, 0, tileset, room_width, room_height);

tile_hitx = ds_list_create(); //List of hit tiles sets
tile_hity = ds_list_create(); //List of hit tiles sets
tile_index = ds_list_create(); //List of tiles index
tile_time = ds_list_create(); //Time a tile should be damaged