/// @desc create walls

if (first_step) exit;


for (var i = 0; i < walls_tospawn; i++) {
	var xx = x + ((walls_side * i) * 32);
	var yy = y - (i * 32);
	repeat (i != 0 ? walls_thickness : 1) {
		var wall = instance_create_depth(xx, yy, depth, oWall);
		yy += 32;
		ds_list_add(walls_spawned, wall);
	}
}

first_step = true;