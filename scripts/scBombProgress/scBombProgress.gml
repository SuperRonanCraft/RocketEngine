///@arg weapon-map
function scBombProgress(argument0) {

	var map = argument0;
	var bomb_map = map[? WEAPON_MAP.MAP];

	if(bomb_map[? BOMB_MAP.TYPE] == WEAPON_BOMB_TYPE.NONE) exit;

	//Set the direction of the bomb
	var dir = team == TEAM.LEFT ? 0 : 180;// point_direction(x,y,aim_target_x,aim_target_y);

	if (auto_aim || team == TEAM.NONE)
		dir = scAutoAim();

	if (map[? WEAPON_MAP.DELAY_TIME] == 0) {
		if (map[? WEAPON_MAP.AMMO] != 0) {
			//show_debug_message(map[?WEAPON_MAP.AMMO]);
			if(bomb_map[? BOMB_MAP.SPAWN_SCRIPT] == noone){
				facing = dir > -90 && dir <= 90 ? 1 : -1;
				var bomb = scSpawnBomb(x,y,depth+1,dir,id,map);
				bomb.spd = bomb_map[? BOMB_MAP.SPEED];
				bomb.hsp = (dcos(bomb.direction) * bomb.spd);
				bomb.vsp = -3;
				scPlaySound(SOUND.EFFECT_SHOOT, random_range(0.3,0.7));
				if (map[? WEAPON_MAP.AMMO] > 0)
					map[? WEAPON_MAP.AMMO]--;
			
			}
			else
				script_execute(bomb_map[? BOMB_MAP.SPAWN_SCRIPT]);
			
			
			//No statistics yet!
		}
	}

	//Cooldown
	map[? WEAPON_MAP.DELAY_TIME] = max(-1, map[? WEAPON_MAP.DELAY_TIME] - 1);
	if (map[? WEAPON_MAP.DELAY_TIME] == -1)
		map[? WEAPON_MAP.COOLDOWN_TIME] = max(0, map[? WEAPON_MAP.COOLDOWN_TIME] - 1);
	

	//Reload
	if (map[? WEAPON_MAP.AMMO] == 0)
		if (map[? WEAPON_MAP.RELOAD_TIME] > bomb_map[? BOMB_MAP.RELOAD_TIME]) {
			map[? WEAPON_MAP.AMMO] = bomb_map[? BOMB_MAP.CLIP];
			map[? WEAPON_MAP.RELOAD_TIME] = 0;
		} else
			map[? WEAPON_MAP.RELOAD_TIME]++;


}
