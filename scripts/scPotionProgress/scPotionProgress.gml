///@arg weapon-map
function scPotionProgress(argument0) {

	var map = argument0;
	var potion_map = map[? WEAPON_MAP.MAP];

	if(potion_map[? POTION_MAP.TYPE] == WEAPON_POTION_TYPE.NONE) exit;

	//Set the direction of the potion
	var dir = team == TEAM.LEFT ? 0 : 180;// point_direction(x,y,aim_target_x,aim_target_y);

	if (auto_aim || team == TEAM.NONE)
		dir = scAutoAim();

	if (map[? WEAPON_MAP.DELAY_TIME] == 0) {
		if (map[? WEAPON_MAP.AMMO] != 0) {
			//show_debug_message(map[?WEAPON_MAP.AMMO]);
			if(potion_map[? POTION_MAP.SPAWN_SCRIPT] == noone){
				facing = dir > -90 && dir <= 90 ? 1 : -1;
				var potion = scSpawnPotion(x,y,depth+1,dir,id,map);
				potion.spd = potion_map[? POTION_MAP.SPEED];
				potion.hsp = (dcos(potion.direction) * potion.spd) + (gravity_map[?GRAVITY_MAP.HSP] * 0.8);
				potion.vsp = (gravity_map[?GRAVITY_MAP.VSP]*0.8) + (potion_map[? POTION_MAP.SPEED]*-0.4);
				scPlaySound(SOUND.EFFECT_SHUR_THROW);
				if (map[? WEAPON_MAP.AMMO] > 0)
					map[? WEAPON_MAP.AMMO]--;
			
			}
			else
				script_execute(potion_map[? POTION_MAP.SPAWN_SCRIPT]);
			
			
			//No statistics yet!
		}
	}

	//Cooldown
	map[? WEAPON_MAP.DELAY_TIME] = max(-1, map[? WEAPON_MAP.DELAY_TIME] - time_dialation);
	if (map[? WEAPON_MAP.DELAY_TIME] == -1)
		map[? WEAPON_MAP.COOLDOWN_TIME] = max(0, map[? WEAPON_MAP.COOLDOWN_TIME] - time_dialation);
	

	//Reload
	if (map[? WEAPON_MAP.AMMO] == 0)
		if (map[? WEAPON_MAP.RELOAD_TIME] > potion_map[? POTION_MAP.RELOAD_TIME]) {
			map[? WEAPON_MAP.AMMO] = potion_map[? POTION_MAP.CLIP];
			map[? WEAPON_MAP.RELOAD_TIME] = 0;
		} else
			map[? WEAPON_MAP.RELOAD_TIME]+= time_dialation;


}
