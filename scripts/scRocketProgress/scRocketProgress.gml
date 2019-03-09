/// @desc Check when to shoot a tocket
/// @arg team (-1 to disable team checking)


if (rocket_map[? ROCKET_MAP.TYPE] == ROCKET.NONE) exit;
//Set the direction of the rocket
var dir = argument0 == -1 ? (facing == 1 ? 0 : 180) : (argument0 == TEAM.LEFT ? 0 : 180);

//Rocket
if (current_delay == 0) {
	if (ammo != 0) {
		facing = dir > -90 && dir <= 90 ? 1 : -1;
		
		var offset = rocket_map[? ROCKET_MAP.OFFSET];
		scSpawnRocket(x + lengthdir_x(offset, dir), y + lengthdir_y(offset, dir), depth + 1, dir, id, rocket_map);
		ammo -= 1;
		//Sound effects and screen shaking
		scPlaySound(rocket_map[? ROCKET_MAP.SOUND_SHOOT], random_range(0.8, 1.2));
		scScreenShake(rocket_map[? ROCKET_MAP.SHAKE_MAGNITUDE], rocket_map[? ROCKET_MAP.SHAKE_FRAMES]);
		scRecoil(rocket_map[? ROCKET_MAP.RECOIL]);
		//Add to rockets shot count
		if (track_stats)
			scStatsCache(STATISTICS_TYPE.VALUE_GENERAL, [STATISTICS_GENERAL.ROCKETS_SHOT],
				[scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.ROCKETS_SHOT) + 1]);
	}
}

//Cooldown
current_delay = max(-1, current_delay - 1);
if (current_delay == -1)
	current_cd = max(0, current_cd - 1);
//current_recoil = max(0, floor(current_recoil * 0.8));

//Reload
if (ammo == 0)
	if (current_reload > rocket_map[? ROCKET_MAP.RELOAD_TIME]) {
		ammo = rocket_map[? ROCKET_MAP.CLIP];
		current_reload = 0;
	} else
		current_reload++;