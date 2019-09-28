/// @desc Push player modifiers
//Alter hp and ults
with (oPlayer) {
	var hp = shootable_map[? SHOOTABLE_MAP.HEALTH];
	switch (global.mode_rumble_health) {
		case 0: hp /= 10; break;
		case 1: hp /= 2; break;
		case 2: hp *= 1; break;
		case 3: hp *= 2; break;
		case 4: hp *= 5; break;
		case 5: hp *= 10; break;
	}
	shootable_map[? SHOOTABLE_MAP.HEALTH] = hp;
	shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL] = hp;
	scStageUltimateStart(global.mode_rumble_ultimates);
	//weapon_map[? WEAPON_MAP.ENABLED] = global.mode_1v1_weapon;
	if (global.mode_rumble_singleplayer == 1 && team == TEAM.RIGHT)
		scStartAI();
	else if (global.mode_rumble_singleplayer == 2)
		scStartAI();
	auto_aim = true;
}