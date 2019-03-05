if (ds_exists(rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS], ds_type_list) 
	&& !ds_list_empty(rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS])) {
	var events = rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS];
	for (var i = 0; i < ds_list_size(events); i++)
		script_execute(events[| i]);
}
if (rocket_map[? ROCKET_MAP.ROCKET_DRAW_UNDER] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_DRAW_UNDER]);
if (sprite_index != noone)
	draw_self();
if (rocket_map[? ROCKET_MAP.ROCKET_DRAW_OVER] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_DRAW_OVER]);
	
if (rocket_map[? ROCKET_MAP.PARTICLE_TRAIL] != noone && !destroy) {
	//Particle emitter first gets placed around the back of the rocket
	var offset = rocket_map[? ROCKET_MAP.OFFSET];
	var xx = x - lengthdir_x(offset, direction), yy = y - lengthdir_y(offset, direction);
	var ptrail = rocket_map[? ROCKET_MAP.PARTICLE_TRAIL];
	if (rocket_map[? ROCKET_MAP.PARTICLE_CHANGE_ORIENTATION])
		part_type_orientation(ptrail, direction, direction, 0, 0, 0);
	part_emitter_region(global.ParticleSystem1, global.Emitter1, xx + 1, xx - 1, yy + 1, yy - 1, ps_shape_ellipse, ps_distr_gaussian);
	//Then bursts with the defined particle over at oParticleHandler
	part_emitter_burst(global.ParticleSystem1, global.Emitter1, ptrail, rocket_map[? ROCKET_MAP.PARTICLE_AMT]);
}

//Grow into the stage
if (!destroy)
	if (image_xscale != original_xscale)
		image_xscale = clamp(image_xscale + scale_speed, -original_xscale, original_xscale);
	if (image_yscale != original_yscale) {
		var val = sign(original_yscale);
		image_yscale = clamp(image_yscale + (scale_speed * val), -original_yscale * val, original_yscale * val);
	}

//Show rocket collision box while in debug mode
if (global.debug)
	scDrawRect(bbox_left, bbox_top, bbox_right, bbox_bottom, c_blue, true, 1);