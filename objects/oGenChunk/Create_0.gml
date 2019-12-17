chunk_width = CHUNK_SIZE / BLOCK_SIZE;
chunk_grid = noone;

chunk_generated = false; //Have we generated our chunks?
chunk_flatten = true; //Dont flatten
chunk_flatness = 4; //How many times to flatten terrain
chunk_surface = noone;
chunk_id = noone; //My Chunk ID
chunk_walls = ds_list_create();
alarm[0] = room_speed; //Unload chunk check