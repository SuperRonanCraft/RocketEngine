/// @desc 

var amt = 1, type = PARTICLES.PORTAL;
if (portal_used_entry) {
	portal_used_entry = false;
	amt = 100;
	type = PARTICLES.SPARKLE;
} 
scDrawParticle(exit_x - marginx, exit_y - marginy, exit_x + marginx, exit_y + marginy, type, amt);

amt = 1;
type = PARTICLES.PORTAL
if (portal_used_exit) {
	portal_used_exit = false;
	amt = 100;
	type = PARTICLES.SPARKLE;
}
scDrawParticle(x - marginx, y - marginy, x + marginx, y + marginy, type, amt);


if (exit_created) {
	scDrawSpriteExt(exit_x, exit_y, sprite_index, image_index, noone, 
		portal_alpha, image_xscale, image_yscale);
} else {
	with (owner) {
		var len = 50, width = 3, margin = 2;
		var yy = bbox_top - 10 - (width + margin), xx = x - (len / 2);
		var percent = other.timer / other.timer_org;
		scDrawLine(xx - (margin / 2), yy, xx + len + (margin / 2), yy, c_gray, width + margin, 0.5);
		scDrawLine(xx, yy, xx + (percent * len), yy, c_fuchsia, width, 0.5);
	}
}

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