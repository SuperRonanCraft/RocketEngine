/// @desc draw end game text
if (!calculated) exit;
var c = c_red, c2 = c_green, c3 = c_yellow;
var yy = RES_H / 4;
if (!tie) {
	if (global.winner != noone) {
		var xx = (global.winner == TEAM.LEFT ? RES_W / 4 : RES_W / 2 + RES_W / 4);
		scDrawText(xx, yy, "Winner!", c2, 1);
	}
	if (global.loser != noone) {
		var xx = (global.loser == TEAM.LEFT ? RES_W / 4 : RES_W / 2 + RES_W / 4);
		scDrawText(xx, yy, "Loser!", c, 1);
	}
} else {
	var xx = RES_W / 2;
	scDrawText(xx, yy, "Tie!", c3, 1);
}

//DRAW GAMEMODE SCORE
var scr = string(global.score_stage_p1_wins) + " - " + string(global.score_stage_p2_wins);
scDrawText(RES_W / 2, yy / 2 + 10, scr, c_lime);