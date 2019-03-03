var side = argument[0] == 0 ? 1 : -1;
var map = argument[1];
var xx = x + (map[? "dis"] * side);
var margin = 20;
var yy = y + map[? "hei"];
var checks = 10;
if (xx > room_width)
	xx = room_width - 32;
else if (xx < 0)
	xx = 32;
	
var wall = collision_rectangle(xx - margin, yy - margin, xx + margin, yy + margin, oWall, false, false);
while (wall != noone && checks > 0 && xx < room_width && xx > 0) {
	xx -= 16 * side;
	wall = collision_rectangle(xx - margin, yy - margin, xx + margin, yy + margin, oWall, false, false)
	checks--;
}
with (instance_create_depth(xx, yy, depth + 1, map[? "obj"])) {
	image_xscale *= side;
	direction = argument[0];
	owner = other;
}

/* REQUIRES [dis, hei, obj] */