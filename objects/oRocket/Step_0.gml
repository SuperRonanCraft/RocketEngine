/// @desc Move Rocket

//Run special step script and override movement
if (rocket_map[? ROCKET_MAP.ROCKET_STEP] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_STEP]);
else {
	var spd = rocket_map[? ROCKET_MAP.SPEED];
	scMovementLine(spd, direction);
}

if (timer > 0)
	timer--;
else if (timer == 0)
	event_user(0);

if (x > room_width + 20 || x < -20 || y > room_height || y < -20)
	event_user(0);
	
if (destroy)
	instance_destroy();