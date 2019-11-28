//@desc Load a players modifiers
//@arg player - Player we are modifying
var player = argument0;

switch (global.gamemode) {
	case GAMEMODE.ONEVONE:
		with (player) {
			var hp = shootable_map[? SHOOTABLE_MAP.HEALTH_BASE];
			switch (global.mode_1v1_health) {
				case 0: hp /= 10; break;
				case 1: hp /= 2; break;
				case 2: hp *= 1; break;
				case 3: hp *= 2; break;
				case 4: hp *= 5; break;
				case 5: hp *= 10; break;
			}
			shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = hp;
			shootable_map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] = hp;
			scStageUltimateStart(global.mode_1v1_ultimates);
			weapon_map[? WEAPON_MAP.ENABLED] = global.mode_1v1_weapon;
			if (global.mode_1v1_singleplayer == 1 && team == TEAM.RIGHT)
				scStartAI();
			else if (global.mode_1v1_singleplayer == 2)
				scStartAI();
			//if (global.mode_1v1_lowgravity)
			//	grv /= 2;
		}
		break;
	case GAMEMODE.TARGETS:
		with (player) {
			var hp = shootable_map[? SHOOTABLE_MAP.HEALTH_BASE];
			switch (global.mode_targets_difficulty) {
				case 0: hp = 10; break;
				case 1: hp = 6; break;
				case 2: hp = 2; break;
			}
			shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = hp;
			shootable_map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] = hp;
			scWeaponModify(id, WEAPON_MODIFIER.FIRE);
		}
		break;
	case GAMEMODE.KNOCKOUT:
		with (player) {
			var hp = shootable_map[? SHOOTABLE_MAP.HEALTH_BASE];
			switch (global.mode_kb_health) {
				case 0: hp = 2; break;
				case 1: hp = 4; break;
				case 2: hp = 6; break;
				case 3: hp = 10; break;
				case 4: hp = 20; break;
			}
			shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = hp;
			shootable_map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] = hp;
			scStageUltimateStart(global.mode_kb_ultimates);
			player_tech = false; //Disable wall bounce
		}
		break;
	case GAMEMODE.RUMBLE:
		with (player) {
			var hp = shootable_map[? SHOOTABLE_MAP.HEALTH_BASE];
			switch (global.mode_rumble_health) {
				case 0: hp /= 10; break;
				case 1: hp /= 2; break;
				case 2: hp *= 1; break;
				case 3: hp *= 2; break;
				case 4: hp *= 5; break;
				case 5: hp *= 10; break;
			}
			shootable_map[? SHOOTABLE_MAP.HEALTH_BASE] = hp;
			shootable_map[? SHOOTABLE_MAP.HEALTH_BASE_ORIGINAL] = hp;
			scStageUltimateStart(global.mode_rumble_ultimates);
			//weapon_map[? WEAPON_MAP.ENABLED] = global.mode_1v1_weapon;
			if (global.mode_rumble_singleplayer == 1 && team == TEAM.RIGHT)
				scStartAI();
			else if (global.mode_rumble_singleplayer == 2)
				scStartAI();
			auto_aim = true;
		}
		break;
	default: //SINGLEPLAYER, TUTORIAL
		break;
}