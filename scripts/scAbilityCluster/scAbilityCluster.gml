function scAbilityCluster(){
	for (var i = 0; i < 2; i++) {
	    var bomb = scSpawnBomb(x,y,depth-1,scAutoAim(),id,weapon_map);
		bomb.hitWall = true;
		bomb.vsp = -3 + (i*-0.1);
		bomb.hsp = 5 * (dcos(bomb.direction) * bomb.weapon_map[? BOMB_MAP.SPEED]) + (i*5);
	}
	
	for (var i = 0; i < 2; i++) {
	    var bomb = scSpawnBomb(x,y,depth-1,scAutoAim(),id,weapon_map);
		bomb.hitWall = true;
		bomb.vsp = -3 - (i*5);
		bomb.hsp = 5 * (dcos(bomb.direction) * bomb.weapon_map[? BOMB_MAP.SPEED]);
	}
}