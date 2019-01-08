/// @desc Debugger
/*with (oPlayer) {
	draw_set_color(c_black);
	draw_text(view_wport[0]/2, view_hport[0]/8, "vsp " + string(vsp));
	draw_text(view_wport[0]/2, view_hport[0]/8 + 20, "hsp " + string(hsp));
	draw_set_color(c_white);
}*/

if (global.pause && background != noone)
	draw_sprite(background, 0, 0, 0);

if (debug) { //Debug activated
	var instancesInGame = instance_count, playersInGame = instance_number(oPlayer), rocketsInGame = instance_number(oRocket);
	var frames = "\nFPS: " + string(fps_real) + "/" + string(fps);
	var instances = "\nInstances: " + string(instancesInGame);
	var players = "\nPlayers: " + string(playersInGame);
	var rockets = "\nRockets: " + string(rocketsInGame);
	var text = frames + instances + players + rockets;
	var scale = 0.5, yy = RES_H - 20;
	scDrawText(5, yy, text, c_black, scale, c_white, noone, fa_left, fa_bottom);
}
