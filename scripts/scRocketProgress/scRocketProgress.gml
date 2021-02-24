/// @desc Check when to shoot a rocket
/// @arg weapon-map
function scRocketProgress(argument0) {

	var map = argument0;
	var rocket_map = map[? WEAPON_MAP.MAP];

	if (rocket_map[? ROCKET_MAP.TYPE] == WEAPON_ROCKET_TYPE.NONE) exit;
	//Set the direction of the rocket
	var dir = team == TEAM.LEFT ? 0 : 180;// point_direction(x,y,aim_target_x,aim_target_y);

	if (auto_aim || team == TEAM.NONE)
		dir = scAutoAim();

	//Rocket
	if (map[? WEAPON_MAP.DELAY_TIME] == 0) {
		if (map[? WEAPON_MAP.AMMO] != 0) {
			facing = dir > -90 && dir <= 90 ? 1 : -1;
			var offset = rocket_map[? ROCKET_MAP.OFFSET];
			scSpawnRocket(x + lengthdir_x(offset, dir), y + lengthdir_y(offset, dir), depth + 1, dir, id, map);
			if (map[? WEAPON_MAP.AMMO] > 0)
				map[? WEAPON_MAP.AMMO]--;
			scShootableRecoil(rocket_map[? ROCKET_MAP.RECOIL]);
			//Add to rockets shot count
			if (track_stats)
				scStatsCacheAddGeneral(STATISTICS_GENERAL.ROCKETS_SHOT, 1);
		}
	}

	//Cooldown
	map[? WEAPON_MAP.DELAY_TIME] = max(-1, map[? WEAPON_MAP.DELAY_TIME] - 1);
	if (map[? WEAPON_MAP.DELAY_TIME] == -1)
		map[? WEAPON_MAP.COOLDOWN_TIME] = max(0, map[? WEAPON_MAP.COOLDOWN_TIME] - 1);
	//current_recoil = max(0, floor(current_recoil * 0.8));

	//Reload
	if (map[? WEAPON_MAP.AMMO] == 0)
		if (map[? WEAPON_MAP.RELOAD_TIME] > rocket_map[? ROCKET_MAP.RELOAD_TIME]) {
			map[? WEAPON_MAP.AMMO] = rocket_map[? ROCKET_MAP.CLIP];
			map[? WEAPON_MAP.RELOAD_TIME] = 0;
		} else
			map[? WEAPON_MAP.RELOAD_TIME]++;


}
