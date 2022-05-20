/// @desc Destructible Enviroment spawned

tile_timer = 120; //Time in frames to leave a tile be "damaged"
tile_timer_randomize = 8; //Randomize the timer by a maximum of this number
tileset = tsOutHit;
mpGrid = noone;
dsGrid = ds_grid_create(RES_W/BLOCK_SIZE,RES_H/BLOCK_SIZE);
