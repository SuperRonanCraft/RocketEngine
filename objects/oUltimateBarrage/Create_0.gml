/// @desc Spawn a nuke
direction = 270;
image_angle = direction;
move_spd = 5;
//delay between indicating and spawning
spawn_time = 100;

explosion_scale = 3;

//What allows the nuke explosion to be deleted from the room when its animation ends
destroy = false;

//Allow doing damage to the player after hit a shootable once
damage = true;
//The owner of ult
owner = noone;
offset = irandom(100);

//The wall that is in the way
wall = noone;
walllist = ds_list_create();
collision_line_list(x, y, x, RES_H, oWall, true, true, walllist, true);
for (var i = 0; i < ds_list_size(walllist); i++) {
	var w = ds_list_find_value(walllist, i);
	if (w.y > 50) {
		wall = w;
		break;
	}
}
if (instance_place(x, y, object_index))
	instance_destroy();
