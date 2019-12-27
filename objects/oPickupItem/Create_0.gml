/// @desc 
item_map = noone;
item_particle = instance_create_depth(x, y, depth, oPartGravParent);
with (item_particle) {
	weight = 0.1;
	friction_base = 0.9;
	hsp_real = random_range(-5, 5);
	vsp_real = random_range(-10, -5);
	timer = -1;
	sticky = false;
	scaled = true;
	animate = true;
	animate_dur = random_range(1, 2);
	image_xscale = 0;
	image_yscale = 0;
}