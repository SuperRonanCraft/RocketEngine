var map = orbitMap;

if (map[? "dis_crt"] < map[? "dis"])
	map[? "dis_crt"] = min(map[? "dis_crt"] + map[? "dis_chg"], map[? "dis"]);

with (owner) {
	other.x = x + lengthdir_x(map[? "dis_crt"], other.direction);
	other.y = y + lengthdir_y(map[? "dis_crt"], other.direction);
}

direction += map[? "rotation"];
image_angle -= map[? "dir_chg"];
if (direction > 360)
	direction -= 360;
else if (direction < 0)
	direction += 360;