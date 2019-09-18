/// @desc calculate the sprites that will be drawn before drawing
if (first_draw) exit;
first_draw = true;

for (var i = 0; i < string_length(value_damage); i++) {
	var val = string_copy(value_damage, i, 1);
	value_cached[i] = val;
}