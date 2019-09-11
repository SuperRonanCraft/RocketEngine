/// @desc Move Rocket

var rocket_map = weapon_map[? WEAPON_MAP.MAP];
//Run special step script and override movement
var autodestroy = rocket_map[? ROCKET_MAP.ROCKET_AUTO_DESTROY];
var time = rocket_map[? ROCKET_MAP.TIMER];
var checkroom = rocket_map[? ROCKET_MAP.ROCKET_AUTO_DESTROY_ROOM];

if (rocket_map[? ROCKET_MAP.ROCKET_STEP] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_STEP]);
	//---===NO MAP REQUESTS AFTER THIS LINE===---
else {
	var spd = weapon_map[? WEAPON_MAP.SPEED];
	scMovementLine(spd, direction);
}

if (timer < time)
	timer++;
else if (timer == time)
	event_user(0);

if (checkroom)
	if ((x > room_width + 20 || x < -20 || y > room_height + 20 || y < -20) && !destroy)
		event_user(0);
	
if (destroy && autodestroy)
	instance_destroy();