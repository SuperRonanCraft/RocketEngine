//DRAW PLAYER COMBO

if (combo_amount > 1) {
	var xpos = team == TEAM.LEFT ? 50 : RES_W - 50;
	var align = team == TEAM.LEFT ? fa_left : fa_right;
	var ctext = "x" + string(combo_amount) + " " + combo_text_current;
	scDrawText(xpos, 50, ctext, c_yellow, combo_scale * 0.5, noone, noone, align);
}
combo_scale = max(combo_scale * 0.95, 1); //Lower combo scale