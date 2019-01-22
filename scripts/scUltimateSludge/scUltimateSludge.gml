/// @arg ult map

var map = argument0;
var dir = team == TEAM.LEFT ? 1 : -1;
var amt = map[? "amount"];

var ultObj = instance_create_depth(x + (10 * dir), y, depth + 1, oUltimateSludgeShooter);

ultObj.dir = dir;
ultObj.amtMax = amt;

with (ultObj) {
	maxtimer = 3 * room_speed;
	owner = other;
}
