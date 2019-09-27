/// @description  Move Shuriken


//Run special step script and override movement

var shuriken_map = weapon_map[? WEAPON_MAP.MAP];
var time = shuriken_map[? SHURIKEN_MAP.TIMER];
var checkroom = shuriken_map[? SHURIKEN_MAP.SHURIKEN_AUTO_DESTROY_ROOM];


//If there is a special script to run, nullify all else and run it instead
if (shuriken_map[? SHURIKEN_MAP.SHURIKEN_STEP] != noone)
	script_execute(shuriken_map[? SHURIKEN_MAP.SHURIKEN_STEP]);
	//---===NO MAP REQUESTS AFTER THIS LINE===---


//Otherwise, if it is not deactivated:
else if (!deactivate) {
	
	//Adjust hsp and vsp to match trajectory
	var spd = weapon_map[? WEAPON_MAP.SPEED];
	
	
	var dir = direction;
	
	hsp = lengthdir_x(spd, dir);
	vsp = lengthdir_y(spd, dir);
	
	
		
	//Check speed to never go negative or reach 0.
	if(weapon_map[? WEAPON_MAP.SPEED] <= 1){
		weapon_map[? WEAPON_MAP.SPEED] = 1;	
	}
}

//Create particles if not deactivated
if (!deactivate && shuriken_map[? SHURIKEN_MAP.PARTICLE] != noone) {
	part_emitter_region(global.ParticleSystem1, global.Emitter1, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, oParticleHandler.ds_part[? shuriken_map[? SHURIKEN_MAP.PARTICLE]], shuriken_map[? SHURIKEN_MAP.PARTICLE_AMT]);
}

//Increase timer to expire
if (timer < time)
	timer += owner.time_dialation;
	
else if (timer == time && stuckTo != noone)
	if(stuckTo.object_index != oWall)
		event_user(0);
	else
		instance_destroy();
else
	event_user(0);


if(deactivate && stuckTo != noone){
	if(variable_instance_exists(stuckTo,"destroy"))
		if(stuckTo.destroy){
			event_user(0);
			exit;
		}
}

//Stick to a (usually moving) object
if (deactivate && stuckTo != noone && stuckTo.object_index != oWall && instance_exists(stuckTo)){
	x = stuckTo.x + newX;
	y = stuckTo.y + newY;
	
	//Stuck, not moving
	hsp = 0;
	vsp = 0;
	
	//If its a player and they died, do not stick.
	if (stuckTo.object_index == oPlayer)
		if(!stuckTo.player_map[? PLAYER_MAP.ALIVE])
			event_user(0);
			
			
} else if (deactivate && (stuckTo == noone || !instance_exists(stuckTo)))
	event_user(0); //Failsafe check.



//Move shuriken by hsp and vsp ALWAYS
x += hsp * owner.time_dialation;
y += vsp * owner.time_dialation;


//Rotate with hsp
imgdir -= hsp;
image_angle = imgdir;
show_debug_message("+" + string(hsp) + ": " + string(image_angle));


//Despawn if out of room.
if (checkroom)
	if ((x > room_width + 20 || x < -20 || y > room_height + 20 || y < -20))
		instance_destroy();