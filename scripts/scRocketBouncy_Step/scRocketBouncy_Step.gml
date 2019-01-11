/// @desc reflect off wall

var refx = false, refy = false, last_refx = bouncy[? "reflectedx"], last_refy = bouncy[? "reflectedy"];

var spd = rocket_map[? ROCKET_MAP.SPEED];
var hsp = lengthdir_x(spd, direction);
var vsp = lengthdir_y(spd, direction);


var col = false;
var org = direction;
var inst = collision_point(x + hsp, y, oWall, true, false);
if (inst != noone) { //Check x collision
	if (inst.object_index == oSeperator) {
		if (bouncy[? "passbarrier"]) {
			bouncy[? "passbarrier"] = false;
			col = false;
		} else
			col = true;
	} else 
		col = true;
	if (col && !last_refy && !last_refx)
		direction = 180 - direction;
	refx = true;
}

inst = collision_point(x, y + vsp, oWall, true, false);
if (inst != noone) {
	if (inst.object_index == oSeperator) {
		if (bouncy[? "passbarrier"]) {
			bouncy[? "passbarrier"] = false;
			col = false;
		} else
			col = true;
	} else 
		col = true;
	if (col && (!refx && !last_refx))
		direction = 360 - direction;
	refy = true;
}

bouncy[? "reflectedx"] = refx;
bouncy[? "reflectedy"] = refy;

x += hsp;
y += vsp;
if (refx || refy)
	image_angle = direction;

if (org != direction)
	show_debug_message("CHANGED! x=" + string(refx) + " y=" + string(refy) + " bar="+string(bouncy[? "passbarrier"]));