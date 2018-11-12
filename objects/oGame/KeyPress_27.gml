/// @desc Pause game
if (!pause) {
	background = sprite_create_from_surface(application_surface, 0, 0, RES_W, RES_H, false, false, 0, 0);
	instance_deactivate_all(true);
	pause = true;
} else {
	sprite_delete(background);
	background = noone;
	instance_activate_all();
	pause = false;
}