/// @desc Burst ultimate
var dir = 0;
for (var i = 0; i < 5; i++) {
	//Set direction offset
	if (team == TEAM.LEFT)
		dir = 40 - (20 * i);
	else
		dir = 140 + (20 * i);
	//Create the rocket with the new direction
	var xx = x, yy = y;
	while (xx > 0 && xx < RES_W && yy > 0 && yy < RES_H) {
		xx += lengthdir_x(10, dir);
		yy += lengthdir_y(10, dir);
	}
	scDrawLine(x, y, xx, yy, c_red, 4, 0.2);
}