//@desk Check Player Y Check
//@arg gravity_map - map of player
//@arg offset - offset in pixels
//@arg touching - Wall we are touching

var map = argument0;
var offset = argument1;
var touching = argument2;
var y_change = 0;

if (map[? GRAVITY_MAP.VSP] > 0)
	y_change += floor(touching.bbox_top - bbox_bottom - offset);
else if (map[? GRAVITY_MAP.VSP] < 0)
	y_change += ceil(touching.bbox_bottom - bbox_top + offset);

map[? GRAVITY_MAP.VSP] = 0;
map[? GRAVITY_MAP.VSP_MOVE] = map[? GRAVITY_MAP.VSP];
map[? GRAVITY_MAP.VSP_KNOCKBACK] = map[? GRAVITY_MAP.VSP];

y += y_change;