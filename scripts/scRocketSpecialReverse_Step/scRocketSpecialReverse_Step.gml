/// @desc Reverse rocket step script

var teleported = rev_map[? "teleported"];
var teleporting = rev_map[? "teleporting"];
var org_xscale = rev_map[? "org_xscale"];
var offset = rev_map[? "offset"];

if (!teleporting)
	if (x < offset && (direction > 90 && direction < 270)) {
		rev_map[? "side"] = true;
		teleporting = true;
	} else if (x > RES_W - offset && (direction >= 270 || direction <= 90)) {
		teleporting = true;
		rev_map[? "side"] = false;
	}

var side = rev_map[? "side"];

//Animate
if (!teleported) {
	if (teleporting) {
		if (original_xscale != 0)
			original_xscale = max(original_xscale - (0.1 * org_xscale), 0);
		else {
			if (side)
				x = RES_W - offset;
			else
				x = offset;
			teleported = true;
		}
	} else {
		var spd = rocket_map[? ROCKET_MAP.SPEED];
		x += lengthdir_x(spd, direction);
		y += lengthdir_y(spd, direction);
		var mid = RES_W / 2;
		if (x > mid - spd && x < mid + spd) event_user(0); //Destroy when in middle of screen
	}
} else {
	if (original_xscale != org_xscale)
		original_xscale = min(original_xscale + (0.1 * org_xscale), org_xscale);
	else {
		teleported = false;
		teleporting = false;
	}
}

rev_map[? "teleported"] = teleported;
rev_map[? "teleporting"] = teleporting;