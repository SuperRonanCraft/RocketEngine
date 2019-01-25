/// @desc Reset timer
if (item == noone || other.owner.team == team) exit; //Same team or no item

item = noone; //Reset item
timer_current = timer; //Reset timer
with (other)
	event_user(0);