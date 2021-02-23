/// @desc Reset timer
if (item == noone || other.owner.team == team || hacked) exit; //Same team or no item


var rocket_map = other.weapon_map[? WEAPON_MAP.MAP];


if (other.weapon_map[? WEAPON_MAP.TYPE] == WEAPON_TYPE.ROCKET && 
	rocket_map[? ROCKET_MAP.HIT_PICKUP] != noone)
	script_execute(rocket_map[? ROCKET_MAP.HIT_PICKUP], other);
else if(other.weapon_map[? WEAPON_MAP.TYPE] == WEAPON_TYPE.ROCKET){
	item = noone; //Reset item
	timer_current = timer; //Reset timer
	with (other)
		event_user(0);
}