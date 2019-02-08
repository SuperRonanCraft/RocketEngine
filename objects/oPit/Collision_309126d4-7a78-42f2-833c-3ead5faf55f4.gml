/// @desc touching a player

with (other)
	if (hp > 0) {
		scDamageShootable(other, false, false, 1, true);
		if (hp > 0) {
			var xx = xstart, yy = ystart;
			with (oGMMSingle) {
				var check_point = scCheckpointGet(player_checkpoint);
				if (check_point != noone) {
					xx = check_point.x;
					yy = check_point.y;
				}
			}
			x = xx; y = yy;
			hsp_knockback = 0;
			vsp_knockback = 0;
			vsp_move = 0;
			ds_map_add(other.respawns, id, other.respawn_time);
			image_alpha = 0.5;
			current_cd = other.respawn_time;
			//Toggle getting hit by rocket
			rockets_hit = false;
		}
	}