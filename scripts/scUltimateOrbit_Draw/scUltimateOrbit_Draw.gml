var map = argument[1];

var dis = map[? "dis"];
var amt = map[? "amt"];
var dir = (360 / amt);
var offset = map[? "ang"];
for (var i = 1; i <= amt; i++)
	scDrawCircle(x + lengthdir_x(dis - 5, dir * i + offset), y + lengthdir_y(dis - 5, dir * i + offset), 10, c_red, false, 0.5);
map[? "ang"] += map[? "ang_chg"];
if (map[? "ang"] > 360 / amt)
	map[? "ang"] -= 360 / amt;