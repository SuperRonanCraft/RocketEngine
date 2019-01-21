/// @desc grow into the stage
if (first_draw) exit;

var scale = rocket_map[? ROCKET_MAP.SCALE];
original_xscale = scale;
original_yscale = scale;

//Speed to grow the rocket
scale_speed = ((abs(scale) + abs(scale)) / 2) / 10;

image_xscale = scale / 4;
image_yscale = scale / 4;

if (rocket_map[? ROCKET_MAP.ROCKET_CREATE] != noone) //Script to run when a rocket has been created
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_CREATE]);

first_draw = true;