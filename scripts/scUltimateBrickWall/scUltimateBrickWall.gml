var side = argument[0] == 0 ? 1 : -1;
var map = argument[1];

var xx = x + (map[? "dis"] * side + (side == -1 ? -32 : 0));
var yy = y - (32 * (map[? "size"] / 2));

with (instance_create_depth(xx, yy, depth - 2, oUltimateBrickWall)) {
	image_yscale = map[? "size"];
	owner = other;
}