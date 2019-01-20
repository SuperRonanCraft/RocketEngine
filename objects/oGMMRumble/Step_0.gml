/// @desc spawn nuke
event_inherited();
if (global.play) { //If game play is enabled
	if (nukes < nukes_max && spawn_time < 0 && random_range(0, 1)) {
		nukes++;
		spawn_time = 60;
	} else
		spawn_time--;
	if (nukes_created < nukes)
		with (instance_create_layer(random_range(50, RES_W - 50), -50, layer, oNuke)) {
			other.nukes_created++;
			owner = other;
		}
}

