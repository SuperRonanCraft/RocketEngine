/// @description  hit a wall

var shuriken_map = weapon_map[? WEAPON_MAP.MAP];
var spd = shuriken_map[? SHURIKEN_MAP.SPEED];

if (shuriken_map[? SHURIKEN_MAP.WALL_SCRIPT] == noone){
	if (!deactivate && shuriken_map[? SHURIKEN_MAP.STICK] && other.shootable || other.is_wall){
		deactivate = true;
		image_speed = 0;
		depth = other.depth;
		scPlaySound(SOUND.EFFECT_SHUR_WALL);
		stuckTo = other.id;
		
		scSpawnParticle(x-hsp, y-vsp, spd*.3, abs(vsp) + abs(hsp), spDebris,WORLDPART_TYPE.DEBRIS);
		
		hsp = 0;
		vsp = 0;
		
		/*
		if(shuriken_map[? SHURIKEN_MAP.SPRITE_STICK] != noone){
			image_index = 0;
			image_speed = 1;
			sprite_index = 	shuriken_map[? SHURIKEN_MAP.SPRITE_STICK];
		}
		*/
	
	} else if (!deactivate && !shuriken_map[?SHURIKEN_MAP.STICK] && other.shootable || other.is_wall){
		scSpawnParticle(x-hsp, y-vsp, spd*.6, abs(vsp) + abs(hsp), spDebris,WORLDPART_TYPE.DEBRIS);
		event_user(0);
	}
	if (!deactivate && other.shootable || other.is_wall){
		deactivate = true;
		event_user(1);
	}
	
} else if (other.shootable || other.is_wall){
	script_execute(shuriken_map[? SHURIKEN_MAP.WALL_SCRIPT]);
}