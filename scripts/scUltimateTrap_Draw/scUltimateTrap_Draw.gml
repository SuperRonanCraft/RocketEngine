/// @arg direction
function scUltimateTrap_Draw(argument0) {
	for (var i = 0; i < 3; i++) {
		var colliding = false;
		var hspd = (argument0 == 0 ? 1 : -1) * (20 + (i * 10));
		var xx = x, yy = y, yspd = -8 + (-4 * i);
		var grv = 1.6;
		while (!colliding) {
			var inst = instance_place(xx, yy, oWall);
			if ((inst != noone && inst.object_index != oSeperator) || !(xx > 0 && xx < room_width && yy > 0 && yy < room_height)) {
				colliding = true;
			} else {
				xx += hspd
				yspd += grv;
				yy += yspd;
				scDrawCircle(xx, yy, 5, c_red, false, 0.5);
			}
		}
	}


}
