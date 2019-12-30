///@arg weapon-map

var map = argument0;
var shuriken_map = map[? WEAPON_MAP.MAP];

if(shuriken_map[? SHURIKEN_MAP.TYPE] == WEAPON_SHURIKEN_TYPE.NONE) exit;

//Set the direction of the shuriken
var dir = point_direction(x,y,aim_target_x,aim_target_y);

//if (auto_aim)
//	dir = scAutoAim();

if (map[? WEAPON_MAP.DELAY_TIME] == 0) {
	if (map[? WEAPON_MAP.AMMO] != 0) {
		//show_debug_message(map[?WEAPON_MAP.AMMO]);
		if(shuriken_map[? SHURIKEN_MAP.SPAWN_SCRIPT] == noone){
			facing = dir > -90 && dir <= 90 ? 1 : -1;
			scSpawnShuriken(x,y,depth+1,dir,id,map);
			scPlaySound(SOUND.EFFECT_SHUR_THROW);
			if (map[? WEAPON_MAP.AMMO] > 0)
				map[? WEAPON_MAP.AMMO]--;
			
		}
		else
			script_execute(shuriken_map[? SHURIKEN_MAP.SPAWN_SCRIPT]);
			
			
		//No statistics yet!
	}
}

//Cooldown
map[? WEAPON_MAP.DELAY_TIME] = max(-1, map[? WEAPON_MAP.DELAY_TIME] - 1);
if (map[? WEAPON_MAP.DELAY_TIME] == -1)
	map[? WEAPON_MAP.COOLDOWN_TIME] = max(0, map[? WEAPON_MAP.COOLDOWN_TIME] - 1);
	

//Reload
if (map[? WEAPON_MAP.AMMO] == 0)
	if (map[? WEAPON_MAP.RELOAD_TIME] > shuriken_map[? SHURIKEN_MAP.RELOAD_TIME]) {
		map[? WEAPON_MAP.AMMO] = shuriken_map[? SHURIKEN_MAP.CLIP];
		map[? WEAPON_MAP.RELOAD_TIME] = 0;
	} else
		map[? WEAPON_MAP.RELOAD_TIME]++;