function scAI1v1Arrow() {
	//@desc Arrow Weapon ai

	//As long as you live, shoot!
	var _map = player.weapon_map;
	var _a_map = _map[? WEAPON_MAP.MAP];
	if (	(!ultReady && player.player_map[? PLAYER_MAP.ALIVE] && irandom_range(0, 10) > 8) || 
			_map[? WEAPON_MAP.CHARGING] || 
			_map[? WEAPON_MAP.COOLDOWN_TIME] == _a_map[? ARROW_MAP.COOLDOWN]) {
		AIShoot = true;	
	} else
		AIShoot = false;

	scAI1v1Default(false);


}
