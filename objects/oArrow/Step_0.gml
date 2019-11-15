/// @description  Move Arrow


//Run special step script and override movement

var arrow_map = weapon_map[? WEAPON_MAP.MAP];
var time = arrow_map[? ARROW_MAP.TIMER];
var checkroom = arrow_map[? ARROW_MAP.SHURIKEN_AUTO_DESTROY_ROOM];


//If there is a special script to run, nullify all else and run it instead
if (arrow_map[? ARROW_MAP.SHURIKEN_STEP] != noone)
	script_execute(arrow_map[? ARROW_MAP.SHURIKEN_STEP]);
	//---===NO MAP REQUESTS AFTER THIS LINE===---

var targetAngle = 270;
if(grv_dir == -1){
	targetAngle = 90;
}



if(!deactivate){
	hsp = spd * facing;
	vsp += (arrow_map[? ARROW_MAP.WEIGHT] * grv_dir)/room_speed;
}

if(!deactivate){
	
	scProjectileMove(arrow_map, touching);

	for (var i = 0; i < ds_list_size(touching); i++) {
    
		var obj = touching[|i];
		if(obj.object_index == oWall){
			deactivate = true;
			event_user(0);
		}
	
	
	}
	
	direction = darctan2(vsp * -grv_dir,hsp);
	image_angle = direction;

}

if(deactivate){
	event_user(0);	
}

x += hsp;
y += vsp;


//Despawn if out of room.
if (checkroom)
	if ((x > room_width + 20 || x < -20 || y > room_height + 20 || y < -20))
		instance_destroy();