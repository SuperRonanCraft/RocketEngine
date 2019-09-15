/// @desc draw end game text
if (!calculated) exit;
var c = c_red, c2 = c_green;
var xx = RES_W / 2;
var yy = RES_H / 4;
if (global.winner == TEAM.LEFT)
	scDrawText(xx, yy, "You Scored " + string(points) + " points!", c2, 1);
else if (global.loser == TEAM.LEFT)
	scDrawText(xx, yy, lost_text, c, 1);