var map = boomMap;

var spd = rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation;
map[? "y"] -= spd;
var yy = map[? "y"], dis = map[? "dis"];
map[? "x"] = ((yy + dis) * (yy)) / (dis * map[? "multi"]);
var xx = map[? "x"];

x = xstart + xx;
y = ystart + yy;

//Update direction
direction += 20 * map[? "side"];//point_direction(xx, yy, ((yy + dis) * ((yy + spd))) / (dis * map[? "multi"]), yy + spd);
image_angle = direction;