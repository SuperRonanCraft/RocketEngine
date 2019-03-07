var side = argument[0] == 0 ? 1 : -1;
var map = argument[1];

var xx = x + (map[? "dis"] * side);
xx -= (side == -1 ? (xx mod 32) + 32 : (xx mod 32) - 32);
var yy = y - (y mod 32);
for (var i = 0; i < map[? "size"]; i++) {
	scDrawRect(xx, yy, xx + 31, yy + 64, c_red, false, 0.5);
	if (i > 1)
		scFlash(0.5, c_red, side, 1, sUltBrickWall, 1, xx + (side == -1 ? 32 : 0) , yy + 32);
	yy -= 32;
	xx += side * 32;
}