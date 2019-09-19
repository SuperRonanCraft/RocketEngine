/// @desc calculate the sprites that will be drawn before drawing
if (first_draw) exit;
first_draw = true;

for (var i = 0; i < string_length(value_damage); i++) {
	var val = string_copy(value_damage, i + 1, 1);
	value_cached[i] = val;
}

if (damage_type == DAMAGETYPE.CRITICAL)
	color = c_orange;
else if (damage_type == DAMAGETYPE.HEALING)
	color = c_lime;
else
	color = c_red;

if (damage_killed || damage_type == DAMAGETYPE.HEALING) {
	color = c_fuchsia;
	hsp = 0;
	alpha_reduce = 0.02 / TIME_SPEED;
}

//Side check
switch (sign(hsp)) {
	case 1: //RIGHT
		if (x >= RES_W - 100)
			hsp *= -1;
		break;
	case -1: //LEFT
		if (x <= 100)
			hsp *= -1;
		break;
}