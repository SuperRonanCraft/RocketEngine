//@desk Check Player X Check
//@arg gravity_map - map of player
//@arg offset - offset in pixels
//@arg touching - Wall we are touching
//@arg HSP - current hsp

var map = argument0;
var offset = argument1;
var touching = argument2;
var x_change = 0;

if (map[? GRAVITY_MAP.HSP] > 0)
	x_change += floor(touching.bbox_left - bbox_right - offset);
else if (map[? GRAVITY_MAP.HSP] < 0)
	x_change += ceil(touching.bbox_right - bbox_left + offset);
		
map[? GRAVITY_MAP.HSP] = 0;
map[? GRAVITY_MAP.HSP_MOVE] = map[? GRAVITY_MAP.HSP];
	
if (map[? GRAVITY_MAP.HSP_KNOCKBACK] != 0)
	if (player_tech)
		scKnockbackBounce();
	else
		map[? GRAVITY_MAP.HSP_KNOCKBACK] = 0;

x += x_change;