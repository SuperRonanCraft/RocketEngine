var map = archMap;

var side = direction > 90 && direction < 270 ? -1 : 1;
var spd = (rocket_map[? ROCKET_MAP.SPEED] * side) * owner.time_dialation;
var xorg = map[? "x"], yorg = map[? "y"]; //original x/y
map[? "x"] += spd;
var xx = map[? "x"], dis = map[? "dis"];
map[? "y"] = (xx * (xx - dis)) / (dis * map[? "multi"]);
var yy = map[? "y"];

x += xx - xorg;
y += yy - yorg;

//Update direction
direction = point_direction(x, y, x + ((xx + spd) - xorg), y + (((xx + spd) * ((xx + spd) - dis)) / (dis * map[? "multi"])) - yorg);
image_angle = direction;