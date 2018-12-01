/// @desc Draw button
draw_sprite(sprite, hovering ? (selected_current_cd > 0 ? 2 : 1) : (selected_current_cd > 0 ? 2 : 0), x, y);
if (selected_current_cd > 0)
	selected_current_cd--;