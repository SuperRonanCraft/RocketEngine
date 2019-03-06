/// @desc create walls

if (first_step) exit;


for (var i = 0; i < walls_tospawn; i++) {
	var xx = x + ((walls_side * i) * 32);
	var yy = y - (i * 32);
	var wall = instance_create_depth(xx, yy, depth, oWall);
	ds_list_add(walls_spawned, wall);
}