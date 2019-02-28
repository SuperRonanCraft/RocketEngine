/// @desc

var buffed = false;
for (var i = 0; i < ds_list_size(rockets_amped); i++)
	if (rockets_amped[| i] == other.id) {
		buffed = true;
		break;
	}
if (!buffed) {
	ds_list_add(rockets_amped, other.id);
	if (!ds_exists(other.rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS], ds_type_list))
		other.rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS] = ds_list_create();
	with (other)
		scUltimateAmpWall_AmpingCreate();
	ds_list_add(other.rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS], scUltimateAmpWall_Amping);
}
