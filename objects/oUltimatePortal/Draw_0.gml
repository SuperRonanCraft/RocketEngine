/// @desc 

//Connecting particle when teleported
if (portal_used_entry || portal_used_exit || portal_connect_img != 0) {
	var dir = point_direction(x, y, exit_x, exit_y) - 90;
	var scale = (point_distance(x, y, exit_x, exit_y) / 64) / 2.2;
	var img = floor(portal_connect_img);
	var alpha = image_alpha - 0.2;
	scDrawSpriteExt(x, y, portal_connect_spr, img, c_white, alpha, noone, scale, dir);
	scDrawSpriteExt(exit_x, exit_y, portal_connect_spr, img, c_white, alpha, noone, scale, dir - 180);
	portal_connect_img += portal_connect_img_spd;
	if (portal_connect_img >= portal_connect_img_max)
		portal_connect_img = 0;
}

var amt = 1, type = PARTICLES.PORTAL;
if (portal_used_entry) { //Entry used particles
	portal_used_entry = false;
	amt = 100;
	type = PARTICLES.SPARKLE;
}
var margx = marginx * 3, margy = marginy * 3;
if (exit_created) //Portal exit particles
	scDrawParticle(exit_x - margx, exit_y - margy, exit_x + margx, exit_y + margy, type, amt);

amt = 1;
type = PARTICLES.PORTAL
if (portal_used_exit) {//Exit used particles
	portal_used_exit = false;
	amt = 100;
	type = PARTICLES.SPARKLE;
}
//Portal entry particles
scDrawParticle(x - margx, y - margy, x + margx, y + margy, type, amt);

if (exit_created) { //Exit is up, draw it and progress bar
	//Draw exit
	scDrawSpriteExt(exit_x, exit_y, sprite_index, image_index, noone, 
		portal_alpha, portal_xscale, portal_yscale);
} else {
	//Draw portal place progress bar
	with (owner) {
		var len = 50, width = 3, margin = 2;
		var yy = bbox_top - 10 - (width + margin), xx = x - (len / 2);
		var percent = other.timer / other.timer_org;
		scDrawLine(xx - (margin / 2), yy, xx + len + (margin / 2), yy, c_gray, width + margin, 0.5);
		scDrawLine(xx, yy, xx + (percent * len), yy, c_fuchsia, width, 0.5);
	}
}

//draw main portal
draw_self();

if (global.debug) {
	//Ignore hitbox
	scDrawRect(exit_x - marginx, exit_y - marginy, exit_x + marginx, exit_y + marginy, c_blue, true, 1);
	scDrawRect(x - marginx, y - marginy, x + marginx, y + marginy, c_blue, true, 1);
	//Teleport hitbox
	var margx = marginx / 4, margy = marginy / 4;
	scDrawRect(exit_x - margx, exit_y - margy, exit_x + margx, exit_y + margy, c_red, true, 1);
	scDrawRect(x - margx, y - margy, x + margx, y + margy, c_red, true, 1);
}