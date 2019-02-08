/// @desc grow into the stage
if (first_draw) exit;

image_alpha = rocket_map[? ROCKET_MAP.ROCKET_ALPHA];
var scale = rocket_map[? ROCKET_MAP.SCALE];

//Speed to grow the rocket
scale_speed = ((abs(scale) + abs(scale)) / 2) / 10;

image_xscale = scale / 4;
image_yscale = scale / 4;

first_draw = true;