///@arg team

var map = weapon_map;
var arrow_map = map[? WEAPON_MAP.MAP];

if(arrow_map[? ARROW_MAP.TYPE] == ARROW.NONE) exit;

//Set the direction of the arrow
var dir = argument0 == TEAM.NONE ? (facing == 1 ? 0 : 180) : (argument0 == TEAM.LEFT ? 0 : 180);

if (auto_aim)
	dir = scAutoAim();

if(!scKeybindsGet(KEYBIND_TYPE.SHOOT)){
	if (map[? WEAPON_MAP.DELAY_TIME] == 0) {
		if (map[?WEAPON_MAP.AMMO] != 0) {
			if(arrow_map[? ARROW_MAP.SPAWN_SCRIPT] == noone){
				facing = dir > -90 && dir <= 90 ? 1 : -1;
				var arrow = scSpawnArrow(x,y,depth+1,dir,id,map);
				
				arrow.spd = arrow.spd *  ((map[? WEAPON_MAP.POWER])/100);
				
				scPlaySound(SOUND.EFFECT_SHUR_THROW);
				
				if (map[? WEAPON_MAP.AMMO] > 0){
					map[? WEAPON_MAP.AMMO]--;
				}
				
				map[? WEAPON_MAP.POWER] = 100;
			
			}
			else
				script_execute(arrow_map[? ARROW_MAP.SPAWN_SCRIPT]);
			
			
			//No statistics yet!
		}
	}

	//Cooldown
	map[? WEAPON_MAP.DELAY_TIME] = max(-1, map[? WEAPON_MAP.DELAY_TIME] - 1);
	if (map[? WEAPON_MAP.DELAY_TIME] == -1){
		map[? WEAPON_MAP.COOLDOWN_TIME] = max(0, map[? WEAPON_MAP.COOLDOWN_TIME] - 1);
	}

	//Reload
	if (map[? WEAPON_MAP.AMMO] == 0)
		if (map[? WEAPON_MAP.RELOAD_TIME] > arrow_map[? ARROW_MAP.RELOAD_TIME]) {
			map[? WEAPON_MAP.AMMO] = arrow_map[? ARROW_MAP.CLIP];
			map[? WEAPON_MAP.RELOAD_TIME] = 0;
		} else
			map[? WEAPON_MAP.RELOAD_TIME]++;
	
}
else if(map[? WEAPON_MAP.DELAY_TIME] == 0){
	map[? WEAPON_MAP.POWER] += arrow_map[? ARROW_MAP.POWER]/room_speed;
	map[? WEAPON_MAP.POWER] = clamp(map[? WEAPON_MAP.POWER],100,200);
	show_debug_message(map[? WEAPON_MAP.POWER]);
}


