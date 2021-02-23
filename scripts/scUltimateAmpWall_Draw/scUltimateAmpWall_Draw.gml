function scUltimateAmpWall_Draw() {
	var side = argument[0] == 0 ? 1 : -1;
	var map = argument[1];

	var xx = x + (map[? "dis"] * side);
	xx -= (side == -1 ? (xx mod 32) + 32 : (xx mod 32) - 32);
	var yy = y - (32 * (map[? "size"] / 2)) - (y mod 32);
	scDrawRect(xx, yy, xx + 32, yy + (32 * (map[? "size"])), c_red, false, 0.5);


}
