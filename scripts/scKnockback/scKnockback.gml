function scKnockback() {
	//Checks every step

	var g_map = gravity_map;
	if (!g_map[? GRAVITY_MAP.KNOCKBACK_ENABLED] ||  //Diabled, exit
		(g_map[? GRAVITY_MAP.HSP_KNOCKBACK] == 0 && g_map[? GRAVITY_MAP.VSP_KNOCKBACK] == 0)) //No knockback, exit
			exit;

	//Particles
	part_particles_create(global.ParticleSystem1, x, y, oParticleHandler.ds_part[? PARTICLES.KBSMOKE], 1);
	//hsp_move = 0;
	//animate correctly
	var map = player_map;
	if (map[? PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.KNOCKBACK && map[? PLAYER_MAP.ALIVE])
		if (sign(facing) == sign(g_map[? GRAVITY_MAP.HSP_KNOCKBACK]))
			map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.KNOCKBACK2;
		else
			map[? PLAYER_MAP.ANIMATION_STATE] = ANIMATIONSTATE.KNOCKBACK;	

	//knockback time was just set to 0, do the following
	if (g_map[? GRAVITY_MAP.HSP_KNOCKBACK] == 0 || g_map[? GRAVITY_MAP.STANDING]) {
		g_map[? GRAVITY_MAP.VSP_MOVE] += g_map[? GRAVITY_MAP.VSP_KNOCKBACK]; //Leave the knockback without instant momentum
		g_map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;
		g_map[? GRAVITY_MAP.VSP_KNOCKBACK] = 0;
	}

	if (g_map[? GRAVITY_MAP.HSP_KNOCKBACK] == 0 && g_map[? GRAVITY_MAP.VSP_KNOCKBACK] == 0 && map[? PLAYER_MAP.ALIVE]){
		map[? PLAYER_MAP.ANIMATION_OVERRIDE] = false;
		map[? PLAYER_MAP.CAN_CONTROL] = true;
		map[? PLAYER_MAP.PLAYER_STATE] = PLAYERSTATE.NORMAL;
	}

	//hsp_knockback -= 0.2 * sign(hsp_knockback);
	//if (abs(g_map[? GRAVITY_MAP.HSP_KNOCKBACK]) < 3)
	//	g_map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;


}
