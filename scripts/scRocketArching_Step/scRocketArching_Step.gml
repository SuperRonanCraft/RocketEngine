var map = archMap;

var spd = (rocket_map[? ROCKET_MAP.SPEED] * map[? "side"]) * owner.time_dialation;
map[? "x"] += spd;
var xx = map[? "x"], dis = map[? "dis"];
map[? "y"] = (xx * (xx - dis)) / (dis * map[? "multi"]);
var yy = map[? "y"];

x = xstart + xx;
y = ystart + yy;

//Update direction
direction = point_direction(xx, yy, xx + spd, ((xx + spd) * ((xx + spd) - dis)) / (dis * map[? "multi"]));
image_angle = direction;