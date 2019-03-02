/// @desc 
if (item == noone || other.parent.team == team || hacked) exit; //Same team or no item

if (other.rocket_map[? ROCKET_MAP.HIT_PICKUP] != noone)
	script_execute(other.rocket_map[? ROCKET_MAP.HIT_PICKUP], other);
else {
	item = noone; //Reset item
	timer_current = timer; //Reset timer
}