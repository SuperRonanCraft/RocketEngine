/// @desc 
if (item_particle != noone) {
	with (item_particle) {
		if (!moving) {
			other.x = x;
			other.y = y;
			other.item_particle = noone;
			instance_destroy();
			image_alpha = other.image_alpha;
		}
	}
	//scDrawSpriteExt(x, y, spr, 0);
} else {
	var _y = y + scMovementWave(-3, 3, animate_dur);
	scDrawSpriteExt(x, _y, sprite_index, image_index, noone, image_alpha, image_xscale, image_yscale, image_angle);
}

if (item_pickup_delay > 0)
	item_pickup_delay--;

var _despawn = true;
if (item_entity_picked != noone && instance_exists(item_entity_picked)) {
	with (item_entity_picked) {
		other.goal_x = x;
		other.goal_y = y;
	}
	var _dis = point_distance(x, y, goal_x, goal_y);
	x = lerp(x, goal_x, goal_speed);
	y = lerp(y, goal_y, goal_speed);
	goal_speed = min(1, goal_speed + 0.03);
	if (image_alpha == 1 && _dis > 10)
		_despawn = false;
	image_xscale = 1 - goal_speed;
	image_yscale = image_xscale;
}

if (item_destroy && _despawn) {
	image_alpha -= 0.04;
	if (image_alpha <= 0)
		instance_destroy();
}