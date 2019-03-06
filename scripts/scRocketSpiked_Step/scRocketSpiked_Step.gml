
var val = 0.3 * owner.time_dialation;
if (direction < 90 && direction > -80)
	direction -= val;
else if (direction > 90 && direction < 260)
	direction += val;

//Bounce on bouncepad
if(instance_exists(oUltimateJumpPad)){
	if(collision_point(x,y,oUltimateJumpPad,false,true)){
		if (direction < 90 && direction > -80)
			direction += 40;
		else if (direction > 90 && direction < 260)
			direction -= 40;
	}
}

image_angle = direction;

var spd = rocket_map[? ROCKET_MAP.SPEED];
scMovementLine(spd, direction);
