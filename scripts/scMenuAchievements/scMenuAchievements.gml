var amt = ACHIEVEMENTS.SECTION, columns = 2, rows = 3, offset = 0;
var pg = page_achievements;
var index = 0, ioffset = 0;

var disabled = 0;

var newi = (pg * (columns * rows)) + ioffset + (pg > 0 ? disabled : 0);
for (var i = newi; index < columns * rows && i < amt; i++) {
	if (index mod columns == 0)
		offset++;
	var name = scAchievementsGetType(ACHIEVEMENT_TYPE.NAME, i);
	var status = scAchievementsGetType(ACHIEVEMENT_TYPE.VALUE, i); //Is it unlocked? (not `noone`)
	var desc = scAchievementsGetType(ACHIEVEMENT_TYPE.DESCRIPTION, i);
	var icon = status != noone ? scAchievementsGetType(ACHIEVEMENT_TYPE.ICON, i) : s_achievement_Locked;
	var rx = ((RES_W / 3) + ((RES_W / 3) * index)) - ((offset - 1) * ((RES_W / 3) * columns));
	var ry = offset * 150 + 30;
	var c = status != noone ? color_element : color_element_special;
	var yoffset = 0;
	var hovering = false;
	if (scUIHovering(rx, ry + 25, name, x_buffer, 60, scale_element, fa_middle)) {
		c = color_main_hovering;
		yoffset = scMovementWave(-3, 3, 1);
		hovering = true;
	}
	scDrawText(rx, ry, name, c, scale_element, noone, noone, noone, fa_bottom); //Achievement Name
	if (hovering && status == noone) { //hovering and locked show progress
		var tracking = scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING_DESC, i);
		if (tracking != noone)
			scDrawText(rx, ry, string(tracking), c, scale_description, noone, noone, noone, fa_top); //Achievement Progress
		else
			scDrawText(rx, ry, desc, c, scale_description, noone, noone, noone, fa_top); //Achievement Desc
	} else
		scDrawText(rx, ry, desc, c, scale_description, noone, noone, noone, fa_top); //Achievement Desc
	scDrawSpriteExt(rx - 32, ry + 25 + yoffset, icon, 0);
	scDrawLine(rx - 64, ry + 106, rx + 64, ry + 106, c_black, 2, 1);
	index++;
}

var max_page = 0;
while (amt - ((max_page + 1) * (columns * rows)) > 0)
	max_page++;
scDrawText(RES_W - (RES_W / 8), RES_H - (RES_H / 8), "Page " + string(pg + 1) + "/" + string(max_page + 1), color_element, scale_element);

//animate hovering rocket
rockets_img += rockets_spd;
if (floor(rockets_img) > 3)
	rockets_img = 0;