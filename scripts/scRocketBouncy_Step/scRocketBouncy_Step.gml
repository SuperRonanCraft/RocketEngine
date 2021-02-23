/// @desc reflect off wall
function scRocketBouncy_Step() {
	var map = bounceMap;

	//var spd = rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation;
	var side = direction > 90 && direction < 270 ? -1 : 1;
	map[? "vsp"] += map[? "grv"] * owner.time_dialation;
	map[? "hsp"] += (-sign(map[? "hsp"]) * map[? "frc"]) * owner.time_dialation;
	if (sign(map[? "hsp"]) != sign(side))
		map[? "hsp"] *= -1;

	//Bounce off wall
	var inst = collision_point(x + map[? "hsp"], y, oWall, true, false);
	if (inst != noone && inst.object_index != oSeperator)
		map[? "hsp"] /= -1.5;

	//Bounce off floor
	var coly = false;
	inst = collision_point(x, y + map[? "vsp"], oWall, true, false);
	if (inst != noone && inst.object_index != oSeperator) {
		map[? "vsp"] /= -1.5;
	
		coly = true;
	}

	//Bounce off pad
	/*if(instance_exists(oUltimateJumpPad)){
	
		if(collision_point(x,y+map[?"vsp"],oUltimateJumpPad,false,true) != noone){
			map[?"vsp"] = abs(map[?"vsp"]) * -2.5;	
			map[? "hsp"] *= 2;
		}

	}*/
	
	x += map[? "hsp"] * owner.time_dialation;
	y += map[? "vsp"] * owner.time_dialation;
	direction = point_direction(x, y, x + map[? "hsp"], y + map[? "vsp"]);
	image_angle = direction;

	//Explode if jumping too low
	if (coly && map[? "vsp"] < 0 && map[? "vsp"] > -2)
		event_user(0);



}
