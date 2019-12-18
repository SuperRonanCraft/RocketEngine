chunk_size = CHUNK_SIZE / BLOCK_SIZE;
chunk_grid = noone; //Chunk blocks info
chunk_noise = noone; //Terrain info

chunk_force_load = false; //Force spawn walls
chunk_generated = false; //Have we generated our chunks?
chunk_flatten = true; //Dont flatten
chunk_flatness = 4; //How many times to flatten terrain
chunk_surface = noone;
chunk_id = noone; //My Chunk ID
chunk_blocks = ds_grid_create(chunk_size, chunk_size); //Spots where was are loaded in
alarm[0] = room_speed; //Unload chunk check