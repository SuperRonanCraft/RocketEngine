/// @desc Game has ended, execute event
//Created for 1v1
if (endgame_delay <= 0) {
	var pamt = instance_number(oPlayer);
	for (var i = 0; i < pamt; i++) {
		var p = instance_find(oPlayer, i);
		with (p) {
			var scale = min(image_xscale + 0.05, 5);
			image_xscale = scale;
			image_yscale = scale;
			image_speed = 0;
			var sidex = (team == TEAM.LEFT ? RES_W / 4 : RES_W / 2 + RES_W / 4);
			var dir = point_direction(x, y, sidex, RES_H / 2);
			var dis = point_distance(x, y, sidex, RES_H / 2);
			if (dis > 5) {
				x += lengthdir_x(5, dir);
				y += lengthdir_y(5, dir);
			}
		}
	}
	if (endgame_delay == 0) {
		global.play = false;
		endgame_delay--;
		//Display end of game event
		event_user(3);
	}
} else
	endgame_delay--;
