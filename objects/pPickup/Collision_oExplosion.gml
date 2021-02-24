/// @desc 
if (item == noone || other.parent.team == team || hacked) exit; //Same team or no item

var rocket_map = other.weapon_map[? WEAPON_MAP.MAP];
if (ds_map_exists(rocket_map, ROCKET_MAP.HIT_PICKUP) && rocket_map[? ROCKET_MAP.HIT_PICKUP] != noone)
	script_execute(rocket_map[? ROCKET_MAP.HIT_PICKUP], other);
else {
	item = noone; //Reset item
	timer_current = timer; //Reset timer
}