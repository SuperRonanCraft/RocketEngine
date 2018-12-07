/// @desc collisions and movement

var plist = ds_list_create();
collision_rectangle_list(xpos1, 0, xpos2, RES_W, oPlayer, false, true, plist, false); //Find all player instances in collision area
for (var i = 0; i < ds_list_size(plist); i++) //Iterate through the player list
	with (ds_list_find_value(plist, i)) //Find it
		if (self != other.owner)
			hsp_override += other.side ? -other.cloud_speed : other.cloud_speed; //Move with cloud
ds_list_destroy(plist);

if (!fading) {
	x += side ? -other.cloud_speed : other.cloud_speed;
	if (side) { //Going left
		if (x < 0) {
			fading = true;
			fading_type = true;
		}
	} else if (x > RES_W) { //Going right
		fading = true;
		fading_type = true;
	}
}
