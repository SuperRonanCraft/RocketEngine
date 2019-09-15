///@arg team

var map = weapon_map;
var shuriken_map = map[? WEAPON_MAP.MAP];

if(shuriken_map[? SHURIKEN_MAP.TYPE] == SHURIKEN.NONE) exit;

//Set the direction of the shuriken
var dir = argument0 == TEAM.NONE ? (facing == 1 ? 0 : 180) : (argument0 == TEAM.LEFT ? 0 : 180);

if (map[? WEAPON_MAP.DELAY_TIME] == 0) {
	if (map[?WEAPON_MAP.AMMO] != 0) {
		//show_debug_message(map[?WEAPON_MAP.AMMO]);
		facing = dir > -90 && dir <= 90 ? 1 : -1;
		scSpawnShuriken(x,y,depth+1,dir,id,map);
		scPlaySound(SOUND.EFFECT_SHUR_THROW);
		if (map[? WEAPON_MAP.AMMO] > 0)
			map[? WEAPON_MAP.AMMO]--;
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