/*with (oPlayer) {
	draw_set_color(c_black);
	draw_text(view_wport[0]/2, view_hport[0]/8, "vsp " + string(vsp));
	draw_text(view_wport[0]/2, view_hport[0]/8 + 20, "hsp " + string(hsp));
	draw_set_color(c_white);
}*/

if (global.pause && background != noone)
	draw_sprite(background, 0, 0, 0);

if (debug) { //Debug activated
	var rocketsInGame = 0, playersInGame = 0, inst = instance_count;
	with (oPlayer) {
		rocketsInGame += rockets;
		playersInGame++;
	}
	var text = "Players: " + string(playersInGame) + "\nRockets: " + string(rocketsInGame)
		+ "\nFPS: " + string(fps_real) + "\nInstances: " + string(inst);
	var scale = 0.5;
	var h = string_height(text), yy = h - (h - (h * scale));
	scDrawText(5, yy, text, c_black, scale, c_white, noone, fa_left, fa_center);
}
