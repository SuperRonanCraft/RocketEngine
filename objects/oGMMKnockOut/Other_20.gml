/// @desc Push player modifiers

//Alter hp and ults
with (oPlayer) {
	var hp = shootable_map[? SHOOTABLE_MAP.HEALTH];
	switch (global.mode_kb_health) {
		case 0: hp = 2; break;
		case 1: hp = 4; break;
		case 2: hp = 6; break;
		case 3: hp = 10; break;
		case 4: hp = 20; break;
	}
	shootable_map[? SHOOTABLE_MAP.HEALTH] = hp;
	shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL] = hp;
	scStageUltimateStart(global.mode_kb_ultimates);
	player_tech = false; //Disable wall bounce
}