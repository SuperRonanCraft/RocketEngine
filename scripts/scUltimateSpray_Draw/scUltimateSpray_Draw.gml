/// @desc Burst ultimate
/// @arg direction
/// @arg map
function scUltimateSpray_Draw(argument0, argument1) {
	var dir = 0;
	var amt = argument1[? "amt"];
	var offset = ((90 / amt) / 2);
	for (var i = 0; i < amt; i++) {
		//Set direction offset
		if (argument0 == 0)
			dir = (45 - offset) - ((90 / amt) * i);
		else
			dir = (135 + offset) + ((90 / amt) * i);
		//Create the rocket with the new direction
		var xx = x, yy = y;
		var colliding = false;
		while(!colliding) {
			//var inst = collision_point(xx, yy, oWall, false, false);
			if (/*(inst == noone || inst.object_index == oSeperator) &&*/ (xx > 0 && xx < room_width && yy > 0 && yy < room_height)) {
				xx += lengthdir_x(64, dir);
				yy += lengthdir_y(64, dir);
			} else
				colliding = true;
		}
		scDrawLine(x, y, xx, yy, c_red, 4, 0.5);
	}


}
