/// @desc Display Health
healthscale = max(healthscale * 0.95, 1);
if (instance_exists(oPlayer))
	var hp = 10; //oPlayer1.hp;
else
	var hp = 10;
//if (true) {
	var offset = 0;
	for (var i = 0; i < hp; i++) {
		if (i mod 10 == 0)
			offset++;
		/*var xpos = (RES_W / 2) + ((sprite_width + 2) * (i - (global.player_health_original / 2))) - (healthscale / 2);*/
		var xpos = ((1920 - 20) - (sprite_width * 10)) + (i mod 10) * (sprite_width + 2);
		var ypos = (offset * (sprite_height + 2)) - 50;
		if (hp > i)
			draw_sprite_ext(sprite_index, 0, xpos, ypos, healthscale, healthscale, 0, c_white, 1);
		else
			draw_sprite_ext(sprite_index, 1, xpos, ypos, healthscale, healthscale, 0, c_white, 1);
	}
//}