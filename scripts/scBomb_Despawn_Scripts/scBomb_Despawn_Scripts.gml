function scBomb_Shotgun_Despawn(){
	var signage = 1;
	for (var i = 0; i < 3; i ++) {
	    var bomb = scSpawnBomb(x +(i*signage), y, depth-1, (i*45), owner, weapon_map);	
		signage *= -1;
		var wmap = bomb.weapon_map[? WEAPON_MAP.MAP];
		
		bomb.spd = wmap[? BOMB_MAP.SPEED];
		bomb.hsp = (dcos(bomb.direction) * bomb.spd);
		bomb.vsp = (dsin(bomb.direction) * bomb.spd);

		wmap[? BOMB_MAP.DESPAWN_SCRIPT] = noone;
	}
}
