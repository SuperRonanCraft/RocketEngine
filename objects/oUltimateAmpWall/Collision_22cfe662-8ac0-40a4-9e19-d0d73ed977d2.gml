/// @desc

var buffed = false;
for (var i = 0; i < ds_list_size(rockets_amped); i++)
	if (rockets_amped[| i] != other.object_index)
		buffed = true;
if (!buffed) {
	ds_list_add(rockets_amped, other.object_index);
	ds_list_add(other.rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS], scUltimateAmpWall_Amping);
}
