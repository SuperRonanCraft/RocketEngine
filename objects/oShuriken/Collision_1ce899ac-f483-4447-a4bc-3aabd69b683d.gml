/// @description  hit a wall

var shuriken_map = weapon_map[? WEAPON_MAP.MAP];

if(shuriken_map[? SHURIKEN_MAP.WALL_SCRIPT] == noone){
	if(!deactivate && shuriken_map[?SHURIKEN_MAP.STICK] && other.shootable || other.is_wall){
		deactivate = true;
		image_speed = 0;
		depth = other.depth;
		scPlaySound(SOUND.EFFECT_SHUR_WALL);
		stuckTo = other.id;
		hsp = 0;
		vsp = 0;
		event_user(1); //missed
	}
}
else if(other.shootable || other.is_wall){
	script_execute(shuriken_map[? SHURIKEN_MAP.WALL_SCRIPT]);
}