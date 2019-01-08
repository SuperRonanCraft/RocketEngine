/// @desc move the mirror y-pos and collision checks

var val = dropping ? mirror_speed : -mirror_speed; //Falling or not
//Smootly come into the room
if (inroom)
	y = clamp(y + val, mirror_height, RES_H);
else {
	if (y - mirror_height < RES_H && y - mirror_height > 0)
		inroom = true;
	y += val;
}

//Bounce
if ((y == RES_H && dropping) || (y - mirror_height == 0 && !dropping)) { //Normal countdown once its fully in frame
	if (bounces < mirror_bounces) {
		dropping = !dropping;
		bounces++;
	} else {
		mirror_height = max(mirror_height - mirror_speed, 0);
		if (mirror_height <= 0)
			instance_destroy(); //Destroy
	}
}
	

//Collision
if (!instance_exists(oRocket)) exit; //None exits? Just exit out
var rlist = ds_list_create();
collision_rectangle_list(xpos1, y, xpos2, y - mirror_height, oRocket, false, true, rlist, false);
for (var i = 0; i < ds_list_size(rlist); i++) {
	var r = rlist[| i];
	if (r.owner != owner) //Is not your rocket
		with (r) {
			if(target != noone)
				target = owner;
			owner = other.owner; //Change the owner
			direction = direction + 180; //Flip the rocket
			image_angle = direction;
		}
}
ds_list_destroy(rlist);