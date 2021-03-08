/// @description  
var shuriken_map = weapon_map[? WEAPON_MAP.MAP];

if (shuriken_map[? SHURIKEN_MAP.WEAPON_SCRIPT] == noone){
	/*
	if (other.weapon_map[? WEAPON_MAP.TYPE] == WEAPON_TYPE.ROCKET && other.owner != owner && !deactivate) {
		event_user(1); //missed
		event_user(0);
		scPlaySound(SOUND.EFFECT_SHUR_WALL);
	}
	*/
} else if (other.owner != owner && !deactivate){
	script_execute(shuriken_map[?SHURIKEN_MAP.WEAPON_SCRIPT], other.id);	
}


