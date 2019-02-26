var map = boomMap;

var side = (direction == 0 ? 1 : -1);
var spd = rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation;
var xorg = map[? "x"], yorg = map[? "y"];
map[? "y"] -= spd;
var yy = map[? "y"], dis = map[? "dis"];
map[? "x"] = ((yy + dis) * (yy)) / (dis * (map[? "multi"] * -side));
var xx = map[? "x"];

x += xx - xorg;
y += yy - yorg;

//Update direction
//point_direction(xx, yy, ((yy + dis) * ((yy + spd))) / (dis * map[? "multi"]), yy + spd);
image_angle += 20 * side;