/// @arg type
/// @arg enum
function scAchievementsGetType(argument0, argument1) {

	var type = argument0
	var enu = argument1;

	var val = "ERROR";

	switch (type) {
		case ACHIEVEMENT_TYPE.SECTION: //SECTION ID OF ACHIEVEMENT
			switch (enu) { //REQUIRED
				case ACHIEVEMENTS.GM_1V1_MULTI: val = "1v1_multiplayer_"; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_100: val = "rockets_100"; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_1000: val = "rockets_1000"; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_10000: val = "rockets_10000"; break;
				case ACHIEVEMENTS.TIME_PLAYED_10M: val = "time_played_10m"; break;
				case ACHIEVEMENTS.TIME_PLAYED_60M: val = "time_played_60m"; break;
				case ACHIEVEMENTS.TIME_PLAYED_360M: val = "time_played_360m"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_10: val = "games_complete_10"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_25: val = "games_complete_25"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_50: val = "games_complete_50"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_100: val = "games_complete_100"; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_10: val = "ultimates_used_10"; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_100: val = "ultimates_used_100"; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_1000: val = "ultimates_used_1000"; break;
				case ACHIEVEMENTS.ROCKETS_CHANGED_10: val = "rockets_changed_10"; break;
				case ACHIEVEMENTS.MEDIC: val = "medic_5"; break;
				case ACHIEVEMENTS.COMBO: val = "combo_3"; break;
				case ACHIEVEMENTS.PORTALS: val = "portals_4"; break;
				case ACHIEVEMENTS.CLONES: val = "clones_2"; break;
				//case ACHIEVEMENTS.SPRING_SLIME: val = "spring_slime"; break;
				case ACHIEVEMENTS.SECTION: val = "Achievements."; break;
				default: val = noone; show_debug_message("NO SECTION FOR ENUM " + string(enu)); break;
			}
			break;
		case ACHIEVEMENT_TYPE.NAME: //NAME OF ACHIEVEMENT
			switch (enu) {
				case ACHIEVEMENTS.GM_1V1_MULTI: val = "Playing with friends!"; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_100: val = "Rocket Noob!"; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_1000: val = "Rocket Frenzy!"; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_10000: val = "Rocket Expert!"; break;
				case ACHIEVEMENTS.TIME_PLAYED_10M: val = "Just getting started"; break;
				case ACHIEVEMENTS.TIME_PLAYED_60M: val = "Feeling the vibe"; break;
				case ACHIEVEMENTS.TIME_PLAYED_360M: val = "I can't feel my hands"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_10: val = "Warming up"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_25: val = "Getting hot"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_50: val = "It's cooking"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_100: val = "Roasted!"; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_10: val = "Ultimate Seeker"; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_100: val = "Ultimate Handler"; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_1000: val = "Ultimate Expert"; break;
				case ACHIEVEMENTS.ROCKETS_CHANGED_10: val = "Weapon Noob!"; break;
				case ACHIEVEMENTS.MEDIC: val = "MEDIC!"; break;
				case ACHIEVEMENTS.COMBO: val = "Combo Beginner"; break;
				case ACHIEVEMENTS.PORTALS: val = "Now You're Thinking!"; break;
				case ACHIEVEMENTS.CLONES: val = "Power in Numbers"; break;
				//case ACHIEVEMENTS.SPRING_SLIME: val = "A Spring in your Step"; break;
				default: val = "Something important"; break;
			}
			break;
		case ACHIEVEMENT_TYPE.DESCRIPTION: //DESCRIPTION OF ACHIEVEMENT
			switch (enu) {
				case ACHIEVEMENTS.GM_1V1_MULTI: val = "Play local 1v1"; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_100: val = "Shoot 100 Rockets"; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_1000: val = "Shoot 1,000 Rockets"; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_10000: val = "Shoot 10,000 Rockets"; break;
				case ACHIEVEMENTS.TIME_PLAYED_10M: val = "Play for 10 Minutes"; break;
				case ACHIEVEMENTS.TIME_PLAYED_60M: val = "Play for 1 Hour"; break;
				case ACHIEVEMENTS.TIME_PLAYED_360M: val = "Play for 6 Hours"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_10: val = "Play 10 games"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_25: val = "Play 25 games"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_50: val = "Play 50 games"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_100: val = "Play 100 games"; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_10: val = "Cast 10 ultimates"; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_100: val = "Cast 100 ultimates"; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_1000: val = "Cast 1,000 ultimates"; break;
				case ACHIEVEMENTS.ROCKETS_CHANGED_10: val = "Pickup 10 rockets"; break;
				default: val = noone; break;
			}
			break;
		case ACHIEVEMENT_TYPE.ICON: //ICON OF ACHIEVEMENT
			switch (enu) {
				case ACHIEVEMENTS.GM_1V1_MULTI: val = s_achievement_1; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_10: val = s_ach_games_10; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_25: val = s_ach_games_25; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_50: val = s_ach_games_50; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_100: val = s_ach_games_100; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_10: val = s_ach_ults_10; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_100: val = s_ach_ults_100; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_1000: val = s_ach_ults_1000; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_100: val = s_ach_shoot_100; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_1000: val = s_ach_shoot_1000; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_10000:  val = s_ach_shoot_10000; break;
				case ACHIEVEMENTS.TIME_PLAYED_10M: val = s_ach_time_10; break;
				case ACHIEVEMENTS.TIME_PLAYED_60M: val = s_ach_time_60; break;
				case ACHIEVEMENTS.TIME_PLAYED_360M: val = s_ach_time_360; break;
				case ACHIEVEMENTS.ROCKETS_CHANGED_10: val = s_achievement_6; break;
				case ACHIEVEMENTS.MEDIC: val = s_achievement_7; break;
				case ACHIEVEMENTS.COMBO: val = s_achievement_8; break;
				case ACHIEVEMENTS.PORTALS: val = s_achievement_9; break;
				case ACHIEVEMENTS.CLONES: val = s_achievement_11; break;
				//case ACHIEVEMENTS.SPRING_SLIME: val = s_achievement_11; break;
				default: val = sTargetBomb; break;
			}
			break;
		case ACHIEVEMENT_TYPE.VALUE:
			val = oAchievementHandler.achieve_map[? scAchievementsGetType(ACHIEVEMENT_TYPE.SECTION, enu)]; break;
		case ACHIEVEMENT_TYPE.TRACKING: //REQUIRED
			switch (enu) {
				case ACHIEVEMENTS.ROCKETS_SHOT_10000:
				case ACHIEVEMENTS.ROCKETS_SHOT_1000:
				case ACHIEVEMENTS.ROCKETS_SHOT_100:
					val = scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.ROCKETS_SHOT); break;
				case ACHIEVEMENTS.TIME_PLAYED_10M:
				case ACHIEVEMENTS.TIME_PLAYED_60M:
				case ACHIEVEMENTS.TIME_PLAYED_360M:
					val = floor((scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.TIME_PLAYED) + (current_time / 1000)) / 60); break;
				case ACHIEVEMENTS.GAMES_COMPLETE_10:
				case ACHIEVEMENTS.GAMES_COMPLETE_25:
				case ACHIEVEMENTS.GAMES_COMPLETE_50:
				case ACHIEVEMENTS.GAMES_COMPLETE_100:
					val = scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.GAMES_COMPLETE); break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_10:
				case ACHIEVEMENTS.ULTIMATES_CASTED_100:
				case ACHIEVEMENTS.ULTIMATES_CASTED_1000:
					val = scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.ULTIMATES_CASTED); break;
				case ACHIEVEMENTS.ROCKETS_CHANGED_10:
					val = scStatsGetType(STATISTICS_TYPE.VALUE_GENERAL, STATISTICS_GENERAL.ROCKETS_CHANGED); break;
				default: val = noone; break;
			}
			break;
		case ACHIEVEMENT_TYPE.TRACKING_DESC:
			switch (enu) {
				case ACHIEVEMENTS.GM_1V1_MULTI: val = "Be social!"; break;
				case ACHIEVEMENTS.ROCKETS_SHOT_10000:
				case ACHIEVEMENTS.ROCKETS_SHOT_1000:
				case ACHIEVEMENTS.ROCKETS_SHOT_100:
					val = "Rockets Shot: " + string(scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING, ACHIEVEMENTS.ROCKETS_SHOT_100)); break;
				case ACHIEVEMENTS.TIME_PLAYED_10M:
				case ACHIEVEMENTS.TIME_PLAYED_60M:
				case ACHIEVEMENTS.TIME_PLAYED_360M:
					var time = scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING, ACHIEVEMENTS.TIME_PLAYED_10M); //Minutes
					var minutes = floor(time) mod 60;
					var hours = floor(time / 60) mod 24;
					var days = floor((time / 60) / 24);
					val = string(days) + " days, " + string(hours) + " hours, " + string(minutes) + " minutes"; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_10:
				case ACHIEVEMENTS.GAMES_COMPLETE_25:
				case ACHIEVEMENTS.GAMES_COMPLETE_50:
				case ACHIEVEMENTS.GAMES_COMPLETE_100:
					val = "Games Played: " + string(scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING, ACHIEVEMENTS.GAMES_COMPLETE_10)); break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_10:
				case ACHIEVEMENTS.ULTIMATES_CASTED_100:
				case ACHIEVEMENTS.ULTIMATES_CASTED_1000:
					val = "Ultimates Casted: " + string(scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING, ACHIEVEMENTS.ULTIMATES_CASTED_10)); break;
				case ACHIEVEMENTS.ROCKETS_CHANGED_10:
					val = "Rockets Picked up: " + string(scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING, ACHIEVEMENTS.ROCKETS_CHANGED_10)); break;
				case ACHIEVEMENTS.MEDIC: val = "Restore 100 health in one game"; break;
				case ACHIEVEMENTS.COMBO: val = "Land a 3+ hit combo"; break;
				case ACHIEVEMENTS.PORTALS: val = "Have multiple portals up"; break;
				case ACHIEVEMENTS.CLONES: val = "Control more than one clone"; break;
				//case ACHIEVEMENTS.SPRING_SLIME: val = "Use a spring while affected by the Slime!"; break;
				default: val = noone; break;
			}
			break;
		case ACHIEVEMENT_TYPE.GOAL:
			switch (enu) {
				//case ACHIEVEMENTS.SPRING_SLIME: val = true; break;
				case ACHIEVEMENTS.CLONES: val = 2; break;
				case ACHIEVEMENTS.PORTALS: val = 2; break;
				//10
				case ACHIEVEMENTS.MEDIC: val = 100; break;
				case ACHIEVEMENTS.COMBO: val = 3; break;
				case ACHIEVEMENTS.TIME_PLAYED_10M:
				case ACHIEVEMENTS.GAMES_COMPLETE_10:
				case ACHIEVEMENTS.ULTIMATES_CASTED_10:
				case ACHIEVEMENTS.ROCKETS_CHANGED_10: val = 10; break;
				//10+
				case ACHIEVEMENTS.GAMES_COMPLETE_25: val = 25; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_50: val = 50; break;
				case ACHIEVEMENTS.TIME_PLAYED_60M: val = 60; break;
				//100
				case ACHIEVEMENTS.ULTIMATES_CASTED_100:
				case ACHIEVEMENTS.GAMES_COMPLETE_100:
				case ACHIEVEMENTS.ROCKETS_SHOT_100: val = 100; break;
				//100+
				case ACHIEVEMENTS.TIME_PLAYED_360M: val = 360; break;
				//1,000
				case ACHIEVEMENTS.ULTIMATES_CASTED_1000:
				case ACHIEVEMENTS.ROCKETS_SHOT_1000: val = 1000; break;
				//10,000
				case ACHIEVEMENTS.ROCKETS_SHOT_10000: val = 10000; break;
				default: val = noone; break; //noone so we dont check the achievement automatically
			}
			break;
		case ACHIEVEMENT_TYPE.GROUP:
			switch (enu) {
				case ACHIEVEMENTS.ROCKETS_SHOT_100:
				case ACHIEVEMENTS.ROCKETS_SHOT_1000:
				case ACHIEVEMENTS.ROCKETS_SHOT_10000:
					val = [ACHIEVEMENTS.ROCKETS_SHOT_100, ACHIEVEMENTS.ROCKETS_SHOT_1000, ACHIEVEMENTS.ROCKETS_SHOT_10000]; break;
				case ACHIEVEMENTS.TIME_PLAYED_10M:
				case ACHIEVEMENTS.TIME_PLAYED_60M:
				case ACHIEVEMENTS.TIME_PLAYED_360M:
					val = [ACHIEVEMENTS.TIME_PLAYED_10M, ACHIEVEMENTS.TIME_PLAYED_60M, ACHIEVEMENTS.TIME_PLAYED_360M]; break;
				case ACHIEVEMENTS.GAMES_COMPLETE_10:
				case ACHIEVEMENTS.GAMES_COMPLETE_25:
				case ACHIEVEMENTS.GAMES_COMPLETE_50:
				case ACHIEVEMENTS.GAMES_COMPLETE_100:
					val = [ACHIEVEMENTS.GAMES_COMPLETE_10, ACHIEVEMENTS.GAMES_COMPLETE_25, ACHIEVEMENTS.GAMES_COMPLETE_50, ACHIEVEMENTS.GAMES_COMPLETE_100]; break;
				case ACHIEVEMENTS.ULTIMATES_CASTED_10:
				case ACHIEVEMENTS.ULTIMATES_CASTED_100:
				case ACHIEVEMENTS.ULTIMATES_CASTED_1000:
					val = [ACHIEVEMENTS.ULTIMATES_CASTED_10, ACHIEVEMENTS.ULTIMATES_CASTED_100, ACHIEVEMENTS.ULTIMATES_CASTED_1000]; break;
				default: //No Group
					val = noone;
					break;
			}
	}

	return val;

	enum ACHIEVEMENTS { //Shows up by order
		//GAMEMODES
		GM_1V1_MULTI,
		//GENERAL
		GAMES_COMPLETE_10, //set
		GAMES_COMPLETE_25, //set
		GAMES_COMPLETE_50, //set
		GAMES_COMPLETE_100, //set
		ULTIMATES_CASTED_10, //set
		ULTIMATES_CASTED_100, //set
		ULTIMATES_CASTED_1000, //set
		ROCKETS_SHOT_100, //set
		ROCKETS_SHOT_1000, //set
		ROCKETS_SHOT_10000, //set
		TIME_PLAYED_10M, //set
		TIME_PLAYED_60M, //set
		TIME_PLAYED_360M, //set
		ROCKETS_CHANGED_10, //set
		//Run Time
		MEDIC,
		COMBO,
		PORTALS,
		CLONES,
		//SPRING_SLIME,
		//Keep last
		SECTION
	}

	enum ACHIEVEMENT_TYPE {
		NAME, //Name of
		DESCRIPTION, //Desc of
		ICON, //Icon to display on achievements page
		SECTION, //Unique indentifier to be cached
		VALUE, //Has it been achieved
		TRACKING, //Number to track
		TRACKING_DESC, //String version when achievement hasnt been achieved
		GOAL, //Value for the achievement to be or higher
		GROUP
	}


}
