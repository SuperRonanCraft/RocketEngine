/// @desc gamemode stage selection draw gui event

//Character title
scDrawText(start_x_default, yy, "Choose Character", color_element, 1);

//UI Draw event
if (!selected)
	event_inherited();
else
	scDrawText(start_x_default, start_y_default, "Waiting on others...", color_element_special, 0.7, noone, 0.8);

with (player) {
	image_alpha = 0;
	var sprite = player_map[? PLAYER_MAP.CURRENT_SPRITE];
	var sprite_img = floor(player_map[? PLAYER_MAP.ANIMATION_VAR]);
	draw_sprite_ext(sprite, sprite_img, other.start_x_default, other.start_y_default + RES_H / 6, 
		facing * 2, 2, 0, c_white, !other.selected ? 1 : 0.1);
}