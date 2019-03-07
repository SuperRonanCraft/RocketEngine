var map = archMap;

//var xorg = map[? "x"], yorg = map[? "y"]; //original x/y
//map[? "x"] += spd;
//var xx = map[? "x"], dis = map[? "dis"];
//map[? "y"] = (xx * (xx - dis)) / (dis * map[? "multi"]);
//var yy = map[? "y"];

//x += xx - xorg;
//y += yy - yorg;

x += lengthdir_x(rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation, direction);
y += (map[? "height"] * cos(map[? "length"] * (map[? "clock"] / 5)));

map[? "clock"] ++;
//Update direction
//direction = point_direction(x, y, x + ((xx + spd) - xorg), y + (((xx + spd) * ((xx + spd) - dis)) / (dis * map[? "multi"])) - yorg);
//image_angle = direction;