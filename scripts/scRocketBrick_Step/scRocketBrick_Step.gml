/// @desc reflect off wall
var map = brickMap;

//var spd = rocket_map[? ROCKET_MAP.SPEED] * owner.time_dialation;
var side = direction > 90 && direction < 270 ? -1 : 1;
map[? "vsp"] += map[? "grv"] * owner.time_dialation;
map[? "hsp"] += (map[? "acc"] * side) * owner.time_dialation;
if (sign(map[? "hsp"]) != sign(side))
	map[? "hsp"] *= -1;
map[? "hsp"] = clamp(map[? "hsp"], -map[? "max"], map[? "max"])


//Always set ramping to false at start of step
map[?"ramping"] = false;

//Bounce off wall
var inst_list = ds_list_create();
instance_place_list(x + map[? "hsp"], y, oWall, inst_list, false);
for (var i = 0; i < ds_list_size(inst_list); i++) {
	var inst = inst_list[| i];
	if (inst != noone && inst.object_index != oSeperator) {
		
		//Check if the wall has space above
		with(inst){
			//show_debug_message( (other.brickMap[?"touching_floor"]) );
			
			//Make sure there is space above the wall
			//And it isnt a separator
			var wallList = ds_list_create();
			var num = collision_point_list(x,y-2,oWall,false,true,wallList,false);
			var wallHit = false;
			if(num > 0){
				for (var i = 0; i < ds_list_size(wallList); i++) {
				    var wallDet = wallList[|i];
					if(wallDet.object_index != oSeperator){
						wallHit = true;
						break;
					}
				}	
			}
			ds_list_destroy(wallList);
			
			if(abs(other.brickMap[?"hsp"]) > 2 && (other.brickMap[?"touching_floor"] || other.brickMap[?"vsp"] < 0 || other.brickMap[?"ramping"]) && !wallHit ){
				other.brickMap[? "ramping"] = true;
				other.y = floor(bbox_top + (other.y - bbox_bottom) - 1);
				
			}
		}
		
		if (map[? "hsp"] > 0) //Going Right
			x = floor(inst.bbox_left + (x - bbox_right) - 1);
		else if (map[? "hsp"] < 0) //Going Left
			x = ceil(inst.bbox_right + (x - bbox_left) + 1);
		
		//If not ramping, stop momentum
		if(!map[?"ramping"])
			map[? "hsp"] = 0;
		
		break;
	}
}

ds_list_clear(inst_list);

//Slide on floor
instance_place_list(x, y + map[? "vsp"] + 1, oWall, inst_list, false);
map[? "touching_floor"] = false;

for (var i = 0; i < ds_list_size(inst_list); i++) {
	var inst = inst_list[| i];
	if (inst != noone && inst.object_index != oSeperator) {
		if (map[? "vsp"] > 0) //Falling
			y = floor(inst.bbox_top + (y - bbox_bottom) - 1);
		else if (map[? "vsp"] < 0) //Going up
			y = ceil(inst.bbox_bottom + (y - bbox_top) + 1);
		
		
		map[? "vsp"] = 0;
		
		map[? "touching_floor"] = true;
		break;
	}
}
ds_list_destroy(inst_list);


if (map[? "ramping"]){
	map[?"hsp"] += 2*sign(map[?"hsp"]);
	map[? "vsp"] += -7;
}
	
x += map[? "hsp"] * owner.time_dialation;
y += map[? "vsp"] * owner.time_dialation;
image_angle = direction;

if (!map[?"ramping"] && map[? "hsp"] == 0 && map[? "vsp"] == 0)
	event_user(0);
