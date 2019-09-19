/// @desc calculate the sprites that will be drawn before drawing
if (first_draw) exit;
first_draw = true;

for (var i = 0; i < string_length(value_damage); i++) {
	var val = string_copy(value_damage, i, 1);
	value_cached[i] = val;
}

if (damage_type == DAMAGETYPE.CRITICAL)
	color = c_orange;
else if (damage_type == DAMAGETYPE.HEALING)
	color = c_lime;
else
	color = c_red;