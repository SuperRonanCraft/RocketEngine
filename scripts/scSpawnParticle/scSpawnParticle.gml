///@arg x
///@arg y
///@arg amount

var xx = argument0;
var yy = argument1;
var amt = argument2;

repeat(amt)
	with (instance_create_depth(xx, yy, depth + 1, oPartGravParent)) {
		weight = random_range(0.2, 0.85);
		friction_base = random_range(0.2, 1);
		hsp_real = random_range(-10, 10);
		vsp_real = random_range(-20, 2);
		timer += irandom_range(-25, 25);
	}