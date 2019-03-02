/// @desc fire rockets

if (!standing) {
	vsp += grv * owner.time_dialation;

	//Fall on floor
	var coly = false;
	var inst = instance_place(x, y + vsp, oWall);
	if (inst != noone && inst.object_index != oSeperator) {
		if (vsp > 0) //Falling
			y = floor(inst.bbox_top + (y - bbox_bottom) - 1);
		else if (vsp < 0) //Going up
			y = ceil(inst.bbox_bottom + (y - bbox_top) + 1);
		vsp = 0;
		standing = true;
	}
	
	y += vsp * owner.time_dialation;
	exit;
}

if (timer <= 0) {
	image_alpha -= alpha_index;
	if (image_alpha <= 0)
		instance_destroy();
} else {
	timer--;
	turret_cd--;
	if (turret_cd <= 0) {
		var offset = owner.rocket_map[? ROCKET_MAP.OFFSET];
		scSpawnRocket(x + lengthdir_x(offset, direction), y, depth + 1, direction, owner, owner.rocket_map, [ROCKET_MAP.ULTIMATE_CHARGE_GIVE], [false]);
		turret_cd = turret_rate;
		turret_offset = turret_offset_max;
	}
}