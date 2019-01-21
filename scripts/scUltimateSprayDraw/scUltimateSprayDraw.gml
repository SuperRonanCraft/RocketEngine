/// @desc Burst ultimate
var dir = 0;
for (var i = 0; i < 6; i++) {
	//Set direction offset
	if (team == TEAM.LEFT)
		dir = 37.5 - (15 * i);
	else
		dir = 142.5 + (15 * i);
	//Create the rocket with the new direction
	var xx = x, yy = y;
	var colliding = false;
	while(!colliding) {
		//var inst = collision_point(xx, yy, oWall, false, false);
		if (/*(inst == noone || inst.object_index == oSeperator) &&*/ (xx > 0 && xx < RES_W && yy > 0 && yy < RES_H)) {
			xx += lengthdir_x(50, dir);
			yy += lengthdir_y(50, dir);
		} else
			colliding = true;
	}
	scDrawLine(x, y, xx, yy, c_red, 4, 0.2);
}