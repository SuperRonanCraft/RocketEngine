/// @desc 

// Inherit the parent event
event_inherited();

var p1 = instance_nearest(0, 0, oPlayer);
var p2 = instance_furthest(0, 0, oPlayer);

xTo = p1.x + ((p2.x - p1.x) / 2);
yTo = p1.y + ((p2.y - p1.y) / 2);