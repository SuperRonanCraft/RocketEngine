/// @desc draw end game text
var c = c_red, c2 = c_green, c3 = c_yellow;
if (array_length_1d(global.loser) <= 1) {
	for (var i = 0; i < array_length_1d(global.winner); i++) {
		if (global.winner[i] == noone) continue;
		var xx = (global.winner[i] == TEAM.LEFT ? RES_W / 4 : RES_W / 2 + RES_W / 4);
		var yy = RES_H / 4;
		scDrawText(xx, yy, "Winner!", c2, 1);
	}
	for (var i = 0; i < array_length_1d(global.loser); i++) {
		var xx = (global.loser[i] == TEAM.LEFT ? RES_W / 4 : RES_W / 2 + RES_W / 4);
		var yy = RES_H / 4;
		scDrawText(xx, yy, "Loser!", c, 1);
	}
} else {
	var xx = RES_W / 2;
	var yy = RES_H / 4;
	scDrawText(xx, yy, "Tie!", c3, 1);
}