/// @desc create walls

if (first_step) exit;

var place_walls = false;
var detected_player = false;

for (var a = 0; a < 2; a++) {
	if (!detected_player)
		for (var i = 0; i < walls_tospawn; i++) {
			var xx = x + ((walls_side * i) * 32);
			var yy = y - (i * 32);
			repeat (i != 0 ? walls_thickness : 1) {
				if (place_walls) {
					var wall = instance_create_depth(xx, yy, depth, oWall);
					ds_list_add(walls_spawned, wall);
				} else if (instance_place(xx, yy, pShootable) != noone) {
					detected_player = true;
					break;
				}
				yy += 32;
			}
		}
	if (!detected_player)
		place_walls = true;
}

//show_debug_message("place = " + string(place_walls) + ", detected = " + string(detected_player))

if (place_walls)
	first_step = true;