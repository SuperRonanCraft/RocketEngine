/// @description  Move Shuriken


//Run special step script and override movement

var time = shuriken_map[? SHURIKEN_MAP.TIMER];
var checkroom = shuriken_map[? SHURIKEN_MAP.SHURIKEN_AUTO_DESTROY_ROOM];

if (shuriken_map[? SHURIKEN_MAP.SHURIKEN_STEP] != noone)
	script_execute(shuriken_map[? SHURIKEN_MAP.SHURIKEN_STEP]);
	//---===NO MAP REQUESTS AFTER THIS LINE===---
else if(!deactivate){
	var spd = shuriken_map[? SHURIKEN_MAP.SPEED];
	scMovementLine(spd, direction);
}

if (timer < time)
	timer++;
else if (timer == time)
	event_user(0);

if(deactivate && stuckTo != noone){
	x = stuckTo.x + newX;
	y = stuckTo.y + newY;
}


if (checkroom)
	if ((x > room_width + 20 || x < -20 || y > room_height + 20 || y < -20))
		event_user(0);