/// @desc draw sprites

scDrawText(x, y, value_damage, c_red, 0.8, noone, alpha, noone, noone, angle);

/*for (var i = 0; i < array_length_1d(value_cached); i++) {
	scDrawSpriteExt(x + (offset * i), y, sprite_index, value_cached[i], noone, alpha);
}*/

y += speed_y;
speed_y += speed_grv;

alpha = max(alpha - alpha_reduce, 0);
if (alpha <= 0)
	instance_destroy();

angle += angle_change * angle_side;