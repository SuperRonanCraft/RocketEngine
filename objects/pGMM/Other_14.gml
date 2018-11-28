/// @desc draw end game text
var c = c_red, c2 = c_green;
if (global.winner != noone) {
	var xx = (global.winner == TEAM.LEFT ? RES_W / 4 : RES_W / 2 + RES_W / 4);
	var yy = RES_H / 4;
	scDrawText(xx, yy, "Winner!", c2, 1);
}
if (global.loser != noone) {
	var xx = (global.loser == TEAM.LEFT ? RES_W / 4 : RES_W / 2 + RES_W / 4);
	var yy = RES_H / 4;
	scDrawText(xx, yy, "Loser!", c, 1);
}