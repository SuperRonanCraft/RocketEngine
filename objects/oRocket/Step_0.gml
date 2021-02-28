/// @desc Move Rocket

if (!instance_exists(owner)) {
	instance_destroy();
	exit;
}

var rocket_map = weapon_map[? WEAPON_MAP.MAP];
//Run special step script and override movement
var autodestroy = rocket_map[? ROCKET_MAP.ROCKET_AUTO_DESTROY];
var time = rocket_map[? ROCKET_MAP.TIMER];
var checkroom = rocket_map[? ROCKET_MAP.ROCKET_AUTO_DESTROY_ROOM];

var _advance = global.play || global.gameover;

if (rocket_map[? ROCKET_MAP.ROCKET_STEP] != noone)
	script_execute(rocket_map[? ROCKET_MAP.ROCKET_STEP]);
	//---===NO MAP REQUESTS AFTER THIS LINE===---
else if (_advance) {
	var spd = weapon_map[? WEAPON_MAP.SPEED];
	scMovementLine(spd, direction);
}

if (timer < time && _advance)
	timer++;
else if (timer >= time && !destroy)
	event_user(0);

if (checkroom)
	if ((x > room_width + 20 || x < -20 || y > room_height + 20 || y < -20) && !destroy)
		event_user(0);
	
if (destroy && autodestroy)
	instance_destroy();