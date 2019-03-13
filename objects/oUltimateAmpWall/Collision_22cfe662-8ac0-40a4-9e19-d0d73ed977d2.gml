/// @desc

if (other.owner != owner)
	exit; //Cannot amp enemy rockets
var buffed = false;
for (var i = 0; i < ds_list_size(rockets_amped); i++)
	if (rockets_amped[| i] == other.id) {
		buffed = true;
		break;
	}
if (!buffed) {
	ds_list_add(rockets_amped, other.id);
	with (other) {
		rocket_map[? ROCKET_MAP.ROCKET_DRAW_EXTRA] = scUltimateAmpWall_Draw_Rocket;
		rocket_map[? ROCKET_MAP.DAMAGE] *= 2;
		rocket_map[? ROCKET_MAP.SPEED] *= 2;
		rocket_map[? ROCKET_MAP.KBAMT] *= 2;
		rocket_map[? ROCKET_MAP.ULTIMATE_CHARGE_GIVE] = false;
		rocket_map[? "shield_spr"] = sRocShield;
		rocket_map[? "shield_img"] = 0;
		rocket_map[? "shield_img_max"] = sprite_get_number(rocket_map[? "shield_spr"]);
		rocket_map[? "shield_img_spd"] = sprite_get_speed(rocket_map[? "shield_spr"]);
		/*rocket_map[? "amp_parts"] = 10;
		rocket_map[? "amp_parts_crt"] = 0;*/
	}
}
