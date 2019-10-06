/// @desc draw sprites

up_time += (5 * min(combo, 5));
switch (damage_type) {
	case DAMAGETYPE.CRITICAL:
		c_rainbow = c_orange; break;
	case DAMAGETYPE.HEALING:
		c_rainbow = c_green; break;
	default:
		c_rainbow = make_color_hsv(up_time mod 255, 255, 255); break;
}
//scDrawText(x, y, value_damage, color, scale, noone, alpha, noone, noone, angle);

for (var i = 0; i < array_length_1d(value_cached); i++)
	scDrawSpriteExt(x + ((offset * (i - 1)) * scale), y, sprite_index, value_cached[i], c_rainbow, alpha, scale, scale, angle);

if (damage_killed)
	scale = lerp(scale, scale_max, 0.04);
else if (vsp < 0)
	scale = lerp(scale, scale_goal, 0.1);

switch (damage_type) {
	case DAMAGETYPE.HEALING:
		vsp = lerp(vsp, -0.25, 0.75);
		break;
	case DAMAGETYPE.CRITICAL:
		vsp += grv;
		hsp = lerp(hsp, 0, 0.05);
		angle += angle_change * angle_side;
		break;
	default:
		if (damage_killed)
			vsp = lerp(vsp, -0.2, 0.07)
		else {
			if (vsp > 0)
				scale = lerp(scale, scale_min, 0.05 / max(1, combo));
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
			reduce = vsp >= -1;
		else
			reduce = vsp >= 0;
		break;
}

if (reduce) {
	if (alpha == 1) //Combo streak = less grav
		grv = lerp(0, grv, 1 / max(1, (min(combo, 10) * 2)));
	alpha = max(alpha - alpha_reduce, 0);
}
	
if (alpha <= 0)
	instance_destroy();