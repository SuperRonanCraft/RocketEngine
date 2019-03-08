var achs = [];
var achs_vals = [];

var gm = global.gamemode;
switch (gm) {
	case GAMEMODE.ONEVONE:
		if (global.mode_1v1_singleplayer == 0) //Played with a real person
			achs = [ACHIEVEMENTS.GM_1V1_MULTI]; achs_vals = [true];
			break;
}

//var index = array_length_1d(achs);
//var ary = [ACHIEVEMENTS.]

scAchievementsSave(achs, achs_vals);