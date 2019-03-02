/// @desc Reset timer
if (item == noone || other.owner.team == team || hacked) exit; //Same team or no item

with (other)
	event_user(0);
if (other.rocket_map[? ROCKET_MAP.HIT_PICKUP] != noone)
	script_execute(other.rocket_map[? ROCKET_MAP.HIT_PICKUP], other);
else {
	item = noone; //Reset item
	timer_current = timer; //Reset timer
}