var _w = CHUNK_SIZE / BLOCK_SIZE;
chunk_grid = ds_grid_create(_w, 1);

chunk_surface = noone;
chunk_id = noone; //My Chunk ID
chunk_walls = ds_list_create();
alarm[0] = room_speed;
//Generate chunk
scGenerateLevel(_w, chunk_grid, oGenerationHandler.seed, oGenerationHandler.chunk_size);
//Generate Blocks
event_user(0);