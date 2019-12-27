/// @desc 
item_map = noone;
item_particle = instance_create_depth(x, y, depth, oPartGravParent);
item_pickup_delay = room_speed * 2;
item_destroy = false;
item_entity_picked = noone; //Did we pick it up?
animate_dur = random_range(1, 2);
goal_x = x;
goal_y = y;
goal_speed = 0.08;
sprite_index = sUIInventoryUtil;
image_speed = 0;
with (item_particle) {
	weight = 0.1;
	friction_base = 0.9;
	hsp_real = random_range(-5, 5);
	vsp_real = random_range(-10, -5);
	timer = -1;
	sticky = false;
	scaled = true;
	//animate = true;
	//animate_dur = random_range(1, 2);
	sprite_index = other.sprite_index;
	image_xscale = 0;
	image_yscale = 0;
}