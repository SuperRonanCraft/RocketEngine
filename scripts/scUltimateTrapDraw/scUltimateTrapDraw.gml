var colliding = false;
var hspd = (team == TEAM.LEFT ? 1 : -1) * 20
var xx = x, yy = y, yspd = -8;
while (!colliding) {
	var inst = instance_place(xx, yy, oWall);
	if (inst != noone && inst.object_index != oSeperator) {
		colliding = true;
	} else {
		xx += hspd
		yspd += 1.8;
		yy += yspd;
		scDrawCircle(xx, yy, 5, c_red, false, 0.2);
	}
}