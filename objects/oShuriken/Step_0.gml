/// @description  Move Shuriken


//Run special step script and override movement

var shuriken_map = weapon_map[? WEAPON_MAP.MAP];
var time = shuriken_map[? SHURIKEN_MAP.TIMER];
var checkroom = shuriken_map[? SHURIKEN_MAP.SHURIKEN_AUTO_DESTROY_ROOM];

if (shuriken_map[? SHURIKEN_MAP.SHURIKEN_STEP] != noone)
	script_execute(shuriken_map[? SHURIKEN_MAP.SHURIKEN_STEP]);
	//---===NO MAP REQUESTS AFTER THIS LINE===---
else if(!deactivate){
	var spd = weapon_map[? WEAPON_MAP.SPEED];
	scMovementLine(spd, direction);
}

if (timer < time)
	timer++;
	
else if (timer == time && stuckTo != "WALL")
	event_user(0);
	
else
	instance_destroy();

if(deactivate && stuckTo != noone && stuckTo != "WALL"){
	if(!stuckTo.player_map[?PLAYER_MAP.ALIVE]){
		event_user(0);
	}
	else{
		x = stuckTo.x + newX;
		y = stuckTo.y + newY;
	}
}
else if(deactivate && stuckTo == noone){
	event_user(0);	
}

if (checkroom)
	if ((x > room_width + 20 || x < -20 || y > room_height + 20 || y < -20))
		event_user(0);