///@arg weapon-map
function scBulletProgress(argument0) {

	var map = argument0;
	var bullet_map = map[? WEAPON_MAP.MAP];

	if(bullet_map[? BULLET_MAP.TYPE] == WEAPON_BULLET_TYPE.NONE) exit;

	if (map[? WEAPON_MAP.COOLDOWN_TIME] != bullet_map[? BULLET_MAP.COOLDOWN]){
		if (map[? WEAPON_MAP.DELAY_TIME] == 0)
			if (map[?WEAPON_MAP.AMMO] != 0) {
				if (bullet_map[? BULLET_MAP.SPAWN_SCRIPT] == noone) {
					//Set the direction of the bullet
					var dir = team == TEAM.LEFT ? 0 : 180;// point_direction(x,y,aim_target_x,aim_target_y);

					if (auto_aim || team == TEAM.NONE)
						dir = scAutoAim();
					facing = dir > -90 && dir <= 90 ? 1 : -1;
					var bullet = scSpawnBullet(x,y,depth+1,dir,id,map);
					bullet.hsp = dcos(bullet.direction) * bullet.spd;
					//bullet.vsp = -dsin(bullet.direction) * bullet.spd;
					scPlaySound(SOUND.EFFECT_SHUR_THROW);
					if (map[? WEAPON_MAP.AMMO] > 0)
						map[? WEAPON_MAP.AMMO]--;
					map[? WEAPON_MAP.POWER] = 100;
				} else
					script_execute(bullet_map[? BULLET_MAP.SPAWN_SCRIPT]);
				//No statistics yet!
			}
		//Cooldown
		map[? WEAPON_MAP.DELAY_TIME] = max(-1, map[? WEAPON_MAP.DELAY_TIME] - 1);
		if (map[? WEAPON_MAP.DELAY_TIME] == -1)
			map[? WEAPON_MAP.COOLDOWN_TIME] = max(0, map[? WEAPON_MAP.COOLDOWN_TIME] - 1);
		//Reload
		if (map[? WEAPON_MAP.AMMO] == 0)
			if (map[? WEAPON_MAP.RELOAD_TIME] > bullet_map[? BULLET_MAP.RELOAD_TIME]) {
				map[? WEAPON_MAP.AMMO] = bullet_map[? BULLET_MAP.CLIP];
				map[? WEAPON_MAP.RELOAD_TIME] = 0;
			} else
				map[? WEAPON_MAP.RELOAD_TIME]++;
		map[? WEAPON_MAP.CHARGING] = false;
	} 
	else if (key_shoot || map[? WEAPON_MAP.DELAY_TIME] == 0) {
		var _min = 100, _max = bullet_map[? BULLET_MAP.POWER_MAX];
		map[? WEAPON_MAP.POWER] += bullet_map[? BULLET_MAP.POWER] / room_speed;
		map[? WEAPON_MAP.POWER] = clamp(map[? WEAPON_MAP.POWER], _min, _max);
		map[? WEAPON_MAP.CHARGING] = true;
		map[? WEAPON_MAP.CHARGE] = (map[? WEAPON_MAP.POWER] - _min) / (_max - _min);
		if (map[? WEAPON_MAP.POWER] >= _max)
			map[? WEAPON_MAP.COOLDOWN_TIME]--; //Cancel out, shoot bullet
	}





}
