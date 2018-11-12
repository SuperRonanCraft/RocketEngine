/// @description Check for no longer selected
if (mouse_check_button_pressed(mb_left)) {
	var button_x = (x - (width / 2)) + width * value;
	var button_y = y;
	var button_radius = sprite_get_width(sSliderButton);
	if (point_in_rectangle(mouse_x, mouse_y, x - (width / 2), y - (height / 2), x + (width / 2), y + (height / 2))
	|| point_in_circle(mouse_x, mouse_y, button_x, button_y, button_radius))
		selected = true;
}

if (!mouse_check_button(mb_left)) 
	selected = false;

if (selected) {
	value = clamp((mouse_x - x + (width / 2)) / width, 0, max_value);
	event_user(0);
	sound_played = false;
} else if (!sound_played) {
	event_user(0);
	audio_play_sound(snHover, 1, false);
	sound_played = true;
}