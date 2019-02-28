/// @desc

var buffed = false;
for (var i = 0; i < ds_list_size(rockets_amped); i++)
	if (rockets_amped[| i] == other.id) {
		buffed = true;
		break;
	}
if (!buffed) {
	ds_list_add(rockets_amped, other.id);
	with (other) {
		if (!ds_exists(rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS], ds_type_list))
			rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS] = ds_list_create();
		scUltimateAmpWall_AmpingCreate();
		ds_list_add(rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRAS], scUltimateAmpWall_Amping);
		rocket_map[? ROCKET_MAP.DAMAGE] += 1;
	}
}
