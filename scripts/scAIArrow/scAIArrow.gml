//@desc ROCKET Weapon ai


//As long as you live, shoot!
if (!ultReady && player.player_map[? PLAYER_MAP.ALIVE] && irandom_range(0, 10) > 8)
	AIShoot = true;	
else
	AIShoot = false;

scAIRocket(false);