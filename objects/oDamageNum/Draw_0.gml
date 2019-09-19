/// @desc draw sprites

up_time += (8 * min(combo, 3));
c_rainbow = make_color_hsv(up_time mod 255,255,255);

//scDrawText(x, y, value_damage, color, scale, noone, alpha, noone, noone, angle);

for (var i = 0; i < array_length_1d(value_cached); i++) {
	scDrawSpriteExt(x + (offset * (i - 1)), y, sprite_index, value_cached[i], c_rainbow, alpha);
}

if (damage_killed)
	scale = lerp(scale, 1.2, 0.04);

switch (damage_type) {
	case DAMAGETYPE.HEALING:
		vsp = lerp(vsp, -1, 0.1);
		break;
	case DAMAGETYPE.CRITICAL:
		vsp += grv;
		hsp = lerp(hsp, 0, 0.05);
		angle += angle_change * angle_side;
		break;
	default:
		if (damage_killed)
			vsp = lerp(vsp, -1, 0.05)
		else {
			vsp += vsp < 0 ? grv : grv / 2;
			hsp = lerp(hsp, 0, 0.05);
		}
		break;
}

y += vsp;
x += hsp;

var reduce = false;
switch (damage_type) {
	case DAMAGETYPE.HEALING:
		reduce = vsp >= -2; break;
	default:
		if (damage_killed)
			reduce = vsp >= -2;
		else
			reduce = vsp >= 0;
		break;
}

if (reduce)
	alpha = max(alpha - alpha_reduce, 0);
	
if (alpha <= 0)
	instance_destroy();