/// @desc draw sprites

scDrawText(x, y, value_damage, color, 0.8, noone, alpha, noone, noone, 0);

/*for (var i = 0; i < array_length_1d(value_cached); i++) {
	scDrawSpriteExt(x + (offset * i), y, sprite_index, value_cached[i], noone, alpha);
}*/

y += vsp;
x += hsp;
vsp += grv;

hsp = lerp(hsp, 0, 0.05);
if (vsp >= 0)
	alpha = max(alpha - alpha_reduce, 0);
if (alpha <= 0)
	instance_destroy();

//angle += angle_change * angle_side;