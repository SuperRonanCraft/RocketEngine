/// @desc Check when to shoot a rocket
/// @arg team (-1 to disable team checking)

var map = weapon_map;
var rocket_map = map[? WEAPON_MAP.MAP];

if (rocket_map[? ROCKET_MAP.TYPE] == ROCKET.NONE) exit;
//Set the direction of the rocket
var dir = argument0 == -1 ? (facing == 1 ? 0 : 180) : (argument0 == TEAM.LEFT ? 0 : 180);

//Rocket
if (map[? WEAPON_MAP.DELAY_TIME] == 0) {
	if (map[? WEAPON_MAP.AMMO] != 0) {
		facing = dir > -90 && dir <= 90 ? 1 : -1;
		var offset = rocket_map[? ROCKET_MAP.OFFSET];
		scSpawnRocket(x + lengthdir_x(offset, dir), y + lengthdir_y(offset, dir), depth + 1, dir, id, rocket_map);
		if (map[? WEAPON_MAP.AMMO] > 0)
			map[? WEAPON_MAP.AMMO]--;
		//Sound effects and screen shaking
		scPlaySound(rocket_map[? ROCKET_MAP.SOUND_SHOOT], random_range(0.8, 1.2));
		scScreenShake(rocket_map[? ROCKET_MAP.SHAKE_MAGNITUDE], rocket_map[? ROCKET_MAP.SHAKE_FRAMES]);
		scRecoil(rocket_map[? ROCKET_MAP.RECOIL]);
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