/// @arg ult map
/// @arg direction
/// @arg map

var map = argument1;
var dir = argument0 == 0 ? 1 : -1;
var amt = map[? "amount"];

var ultObj = instance_create_depth(x + (10 * dir), y, depth + 1, oUltimateSludgeShooter);

ultObj.dir = dir;
ultObj.amtMax = amt;

with (ultObj) {
	maxtimer = 3 * room_speed;
	owner = other;
}
