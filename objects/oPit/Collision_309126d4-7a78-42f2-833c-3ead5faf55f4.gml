/// @desc touching a player

with (other)
	if (hp > 0) {
		scDamageShootable(other, false, false, 1, true);
		if (hp > 0) {
			x = xstart; y = ystart; 
			ds_map_add(other.respawns, id, other.respawn_time);
			image_alpha = 0.5;
			current_cd = other.respawn_time;
			//Toggle getting hit by rocket
			rockets_hit = false;
		}
	}