/// @desc Game has ended, execute event every step event
//Created for 1v1
if (endgame_delay <= 0) {
	//Move players slowy to the center of their team
	for (var i = 0; i < ds_list_size(p_list); i++) {
		var p = p_list[| i];
		with (p) {
			var scale = min(image_xscale + 0.04, 5);
			image_xscale = scale;
			image_yscale = scale * grv_dir;
			image_speed = 0;
			var sidex = x;
			var dir = point_direction(x, y, sidex, RES_H / 2);
			var dis = point_distance(x, y, sidex, RES_H / 2);
			if (dis > 5) {
				x += lengthdir_x(dis / 20, dir);
				y += lengthdir_y(dis / 20, dir);
			}
		}
	}
	if (endgame_delay == 0) {
		endgame_delay--;
		//Calculate game event
		event_user(3);		
	}
} else
	endgame_delay--;
