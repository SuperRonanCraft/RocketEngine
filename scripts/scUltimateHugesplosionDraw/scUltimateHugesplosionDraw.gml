/// @desc Burst ultimate
var len = RES_W / 3;
var xx = x + ((team == TEAM.LEFT ? 1 : -1) * len);

scDrawLine(x, y, xx, y, c_red, 4, 0.2);
scDrawPiePart(xx, y, 1, 1, c_red, 200, 0.4, 4);