var side = argument[0] == 0 ? 1 : -1;
var map = argument[1];
var xx = x + (map[? "dis"] * side);
var yy = y + map[? "hei"];
with (instance_create_depth(xx, yy, depth + 1, oUltimateTurret)) {
	image_xscale = side;
	direction = argument[0];
	owner = other;
}