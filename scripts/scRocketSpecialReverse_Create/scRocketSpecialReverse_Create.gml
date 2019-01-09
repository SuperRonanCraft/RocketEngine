direction += 180; //Reverse its direction
image_angle = direction;
rev_map = ds_map_create();
rev_map[? "side"] = true; //true = left, false = right
rev_map[? "teleported"] = false; //Have we teleported?
rev_map[? "teleporting"] = false; //Are we teleporting?
rev_map[? "org_xscale"] = original_xscale; //The static original xscale of the rocket
rev_map[? "offset"] = 10; //How close to the edge of the screen to get