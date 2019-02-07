
var colliding = false;
var hspd = (team == TEAM.LEFT ? 1 : -1) * 20;
var xx = x, yy = y, yspd = -8;
var grv = 1.6;
while (!colliding) {
	var inst = instance_place(xx, yy, oWall);
	if ((inst != noone && inst.object_index != oSeperator) || !(xx > 0 && xx < room_width && yy > 0 && yy < room_height)) {
		colliding = true;
	} else {
		xx += hspd
		yspd += grv;
		yy += yspd;
		scDrawCircle(xx, yy, 5, c_red, false, 0.2);
	}
}