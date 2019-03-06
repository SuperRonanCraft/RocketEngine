var side = argument[0] == 0 ? 1 : -1;
var map = argument[1];

var xx = x + (map[? "dis"] * side);
xx -= (side == -1 ? (xx mod 32) + 32 : (xx mod 32) - 32);
var yy = y - (y mod 32);

with (instance_create_depth(xx, yy, depth + 1, map[? "ult"])) {
	//image_yscale = map[? "size"];
	walls_tospawn = map[? "size"];
	walls_side = side;
	owner = other;
}