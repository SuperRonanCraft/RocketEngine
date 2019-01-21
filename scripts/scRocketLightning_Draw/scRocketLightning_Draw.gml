
var offset = rocket_map[? ROCKET_MAP.OFFSET];
var xx = x - lengthdir_x(offset, direction), yy = y - lengthdir_y(offset, direction);
repeat (lightning[? "sparks"]) {
	var dir = irandom_range(direction - 25, direction + 25);
	var len = lightning[? "len"];
	scDrawLightning(xx, yy, xx - lengthdir_x(len, dir), yy - lengthdir_y(len, dir), irandom(lightning[? "branches"]), c_aqua);
}

//if (lightning[? "explode"]) {
	//var dir = irandom_range(260, 280);
	//scDrawLightning(x + irandom_range(-20, 20), 0, x, y, irandom(lightning[? "branches"]), c_aqua);
	//event_user(0);
//}