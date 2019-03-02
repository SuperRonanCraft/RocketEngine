var map = boomMap;

map[? "side"] = direction == map[? "dir"] ? map[? "side"] : -map[? "side"];
var side = map[? "side"];
var spd = rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation;
var xorg = map[? "x"] * (direction == map[? "dir"] ? 1 : -1), yorg = map[? "y"];
map[? "y"] -= spd;
var yy = map[? "y"], dis = map[? "dis"];
map[? "x"] = ((yy + dis) * (yy)) / (dis * (map[? "multi"] * -side));
var xx = map[? "x"];

x += xx - xorg;
y += yy - yorg;

//Update direction
yy -= spd;
direction = point_direction(xx, yy + spd, ((yy + dis) * (yy)) / (dis * (map[? "multi"] * -side)), yy);
map[? "dir"] = direction;
image_angle += 20 * side;