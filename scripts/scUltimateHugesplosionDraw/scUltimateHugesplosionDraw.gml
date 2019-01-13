/// @desc Burst ultimate
var len = RES_W / 2;
var xxpos = x + ((team == TEAM.LEFT ? 1 : -1) * len);

scDrawLine(x, y, xxpos, y, c_red, 4, 0.2);
scDrawCircle(xxpos, y, 10, c_red, false, 0.2);
var dir = -(360 / 8) / 2;
for (var i = 0; i < 8; i++) {
	dir += (360 / 8);
	var xx = xxpos, yy = y;
	var colliding = false;
	while(!colliding) {
		var inst = collision_point(xx, yy, oWall, false, false);
		if ((inst == noone || inst.object_index == oSeperator) && (xx > 0 && xx < RES_W && yy > 0 && yy < RES_H)) {
			xx += lengthdir_x(10, dir);
			yy += lengthdir_y(10, dir);
		} else
			colliding = true;
	}
	scDrawLine(xxpos, y, xx, yy, c_red, 4, 0.2);
}