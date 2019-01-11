/// @desc move the mirror y-pos and collision checks

var val = dropping ? mirror_speed : -mirror_speed; //Falling or not
//Smootly come into the room
if (inroom)
	y = clamp(y + val, mirror_height, RES_H - mirror_height);
else if (!leaving) {
	if (bbox_bottom < RES_H && bbox_top > 0)
		inroom = true;
	y += val;
} else {
	y += val;
	if ((y - mirror_height >= RES_H) || (y + mirror_height <= 0))
		instance_destroy(); //Destroy
}

//Bounce
if (!leaving && (y + mirror_height == RES_H && dropping) || (y - mirror_height == 0 && !dropping)) //Normal countdown once its fully in frame
	if (bounces < mirror_bounces) {
		dropping = !dropping;
		bounces++;
	} else {
		leaving = true;
		inroom = false;
	}