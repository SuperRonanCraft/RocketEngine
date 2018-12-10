/// @desc grow into the stage
if (first_draw) exit;
original_xscale = image_xscale;
original_yscale = image_yscale;

//Speed to grow the rocket
scale_speed = ((image_xscale + image_yscale) / 2) / 10;

image_xscale /= 4;
image_yscale /= 4;

first_draw = true;