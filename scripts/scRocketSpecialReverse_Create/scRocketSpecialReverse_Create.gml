if (owner.playerid == 1 && direction != 180) {
	direction = 180
	image_angle = direction;
} else if (owner.playerid == 2 && direction != 0) {
	direction = 0;
	image_angle = direction;
}
rev_map = ds_map_create();
rev_map[? "side"] = true; //true = left, false = right
rev_map[? "teleported"] = false; //Have we teleported?
rev_map[? "teleporting"] = false; //Are we teleporting?
rev_map[? "org_xscale"] = original_xscale; //The static original xscale of the rocket
rev_map[? "offset"] = 10; //How close to the edge of the screen to get