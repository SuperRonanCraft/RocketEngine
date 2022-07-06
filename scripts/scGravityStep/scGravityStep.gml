function scGravityStep() {
	//No need to send us downward if we are going to stay still
	//Note: Not how physics works in real life

	var map = gravity_map;
	
	map[? GRAVITY_MAP.WALK_SPEED] = shootable_map[?SHOOTABLE_MAP.SPEED];

	if (!map[? GRAVITY_MAP.STANDING] && map[? GRAVITY_MAP.GRAVITY_ENABLED])
		map[? GRAVITY_MAP.VSP_MOVE] = clamp(map[? GRAVITY_MAP.VSP_MOVE] + ((map[? GRAVITY_MAP.GRAVITY] * time_dialation) * grv_dir), -32, 32);
	else if (!map[? GRAVITY_MAP.GRAVITY_ENABLED])
		map[? GRAVITY_MAP.VSP_MOVE] = lerp(map[? GRAVITY_MAP.VSP_MOVE], 0, 0.1);


	scGravityCollision();

	map[? GRAVITY_MAP.HSP_LAST] = map[? GRAVITY_MAP.HSP];
	if (map[? GRAVITY_MAP.VSP] != 0)
		map[? GRAVITY_MAP.VSP_LAST] = map[? GRAVITY_MAP.VSP];

	map[? GRAVITY_MAP.HSP_PUSH] = 0;
	map[? GRAVITY_MAP.VSP_PUSH] = 0;

	//time_dialation = 1;


}
