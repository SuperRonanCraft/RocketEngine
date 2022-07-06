var rocket_map = weapon_map[? WEAPON_MAP.MAP];
if (rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRA] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRA]);
if (rocket_map[? ROCKET_MAP.ROCKET_DRAW_UNDER] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_DRAW_UNDER]);
if (sprite_index != noone) {
	if(owner != undefined && instance_exists(owner)){
		var char_info = owner.player_map[? PLAYER_MAP.CHARACTER_INFO];
		scPalleteSwapSet(char_info[? CHARACTER_MAP.PALETTE], char_info[? CHARACTER_MAP.PALETTE_INDEX]);
	}
	scDrawSpriteExt(x, y, sprite_index, image_index, noone, image_alpha, image_xscale, image_yscale, image_angle + scMovementWave(-5, 5, 1/2));
	//draw_self();
	scPalleteSwapReset();
}
if (rocket_map[? ROCKET_MAP.ROCKET_DRAW_OVER] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_DRAW_OVER]);
	
if (rocket_map[? ROCKET_MAP.PARTICLE_TRAIL] != noone && !destroy) {
	//Particle emitter first gets placed around the back of the rocket
	var offset = rocket_map[? ROCKET_MAP.OFFSET] / 2;
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