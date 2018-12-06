/// @desc Spawn a nuke
direction = 270;
image_angle = direction;
move_spd = 5;
//delay between indicating and spawning
spawn_time = 100;

explosion_scale = 3;

//What allows the nuke to be deleted from the room when its animation ends
destroy = false;
//The gamemode manager
owner = noone;

//The wall that is in the way
var list = ds_list_create();
collision_line_list(x, y, x, RES_H, oWall, true, true, list, true);
wall = ds_list_find_value(list, 0);

damage_done = false; //If it already touched a player