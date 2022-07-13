///@arg weapon-map
function scArrowProgress(argument0) {

	var map = argument0;
	var arrow_map = map[? WEAPON_MAP.MAP];

	if(arrow_map[? ARROW_MAP.TYPE] == WEAPON_ARROW_TYPE.NONE) exit;

	if (!key_shoot || map[? WEAPON_MAP.COOLDOWN_TIME] != arrow_map[? ARROW_MAP.COOLDOWN]){
		if (map[? WEAPON_MAP.DELAY_TIME] == 0)
			if (map[?WEAPON_MAP.AMMO] != 0) {
				if (arrow_map[? ARROW_MAP.SPAWN_SCRIPT] == noone) {
					//Set the direction of the arrow
					var dir = team == TEAM.LEFT ? 0 : 180;// point_direction(x,y,aim_target_x,aim_target_y);

					if (auto_aim || team == TEAM.NONE)
						dir = scAutoAim();
					facing = dir > -90 && dir <= 90 ? 1 : -1;
					var arrow = scSpawnArrow(x,y,depth+1,dir,id,map);
					arrow.dmg = ceil(arrow.dmg *	1.5 * ((map[? WEAPON_MAP.POWER])/100));
					arrow.spd = arrow.spd *  ((map[? WEAPON_MAP.POWER])/100);
					arrow.hsp = dcos(arrow.direction) * arrow.spd;
					arrow.vsp = -dsin(arrow.direction) * arrow.spd;
					arrow.kb = arrow.kb * ((map[? WEAPON_MAP.POWER])/800);
					scPlaySound(SOUND.EFFECT_SHUR_THROW);
					if (map[? WEAPON_MAP.AMMO] > 0)
						map[? WEAPON_MAP.AMMO]--;
					map[? WEAPON_MAP.POWER] = 100;
				} else
					script_execute(arrow_map[? ARROW_MAP.SPAWN_SCRIPT]);
				//No statistics yet!
			}
		//Cooldown
		map[? WEAPON_MAP.DELAY_TIME] = max(-1, map[? WEAPON_MAP.DELAY_TIME] - time_dialation);
		if (map[? WEAPON_MAP.DELAY_TIME] == -1)
			map[? WEAPON_MAP.COOLDOWN_TIME] = max(0, map[? WEAPON_MAP.COOLDOWN_TIME] - time_dialation);
		//Reload
		if (map[? WEAPON_MAP.AMMO] == 0)
			if (map[? WEAPON_MAP.RELOAD_TIME] > arrow_map[? ARROW_MAP.RELOAD_TIME]) {
				map[? WEAPON_MAP.AMMO] = arrow_map[? ARROW_MAP.CLIP];
				map[? WEAPON_MAP.RELOAD_TIME] = 0;
			} else
				map[? WEAPON_MAP.RELOAD_TIME]+= time_dialation;
		map[? WEAPON_MAP.CHARGING] = false;
	} else if (map[? WEAPON_MAP.DELAY_TIME] == 0) {
		var _min = 100, _max = arrow_map[? ARROW_MAP.POWER_MAX];
		map[? WEAPON_MAP.POWER] += time_dialation*(arrow_map[? ARROW_MAP.POWER] / room_speed);
		map[? WEAPON_MAP.POWER] = clamp(map[? WEAPON_MAP.POWER], _min, _max);
		map[? WEAPON_MAP.CHARGING] = true;
		map[? WEAPON_MAP.CHARGE] = (map[? WEAPON_MAP.POWER] - _min) / (_max - _min);
		if (map[? WEAPON_MAP.POWER] >= _max)
			map[? WEAPON_MAP.COOLDOWN_TIME]-= time_dialation; //Cancel out, shoot arrow
	}





}
