/// @desc move the mirror y-pos and collision checks

var val = dropping ? mirror_speed : -mirror_speed; //Falling or not
y = clamp(y + val, 0, RES_H);

//Count down timer
if (y == RES_H && timer > 0) //Normal countdown once its fully in frame
	timer--;
else if (timer == 0) { //Moment it hit 0
	timer--;
	dropping = false; //Flip the movement
} else if (y == 0)
	instance_destroy(); //Destory
	

//Collision
if (!instance_exists(oRocket)) exit; //None exits? Just exit out
var rlist = ds_list_create();
collision_rectangle_list(xpos1, 0, xpos2, y, oRocket, false, true, rlist, false);
for (var i = 0; i < ds_list_size(rlist); i++) {
	var r = ds_list_find_value(rlist, i);
	if (r.owner == owner) continue; //Is your rocket
	with (r) {
		
		if(target != noone){
			target = owner;	
		}
		
		owner = other.owner; //Change the owner
		
		direction = direction + 180; //Flip the rocket
		image_angle = direction;
	}
}
ds_list_destroy(rlist);