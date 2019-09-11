var amt = ACHIEVEMENTS.SECTION, columns = 2, rows = 3;
var y_offset = 0; //Row offset
var pg = page_achievements;

var index_on_page = 0; //Amount of elements on this page
var index = 0; //Paginated

//var index_start = (pg * (columns * rows)) + ioffset + (pg > 0 ? disabled : 0); //Starting page
for (var i = 0; i < amt && index_on_page < (columns * rows); i++) {
	var group = scAchievementsGetType(ACHIEVEMENT_TYPE.GROUP, i);
	var status = scAchievementsGetType(ACHIEVEMENT_TYPE.VALUE, i); //Is it unlocked? (not `noone`)
	var ach_after = [];
	var ach_before = [];
	if (group != noone) { //We are in a group
		var display = i;
		var anyComplete = false;
		for (var gr = 0; gr < array_length_1d(group); gr++) {
			var val = scAchievementsGetType(ACHIEVEMENT_TYPE.VALUE, group[gr]);
			if (val == true) {
				display = group[gr];
				anyComplete = true;
			}
		}
		if (display != i) //Not completed yet
			continue;
		else if (!anyComplete && i != group[0]) //None are complete (display only first)
			continue;
		else { //Completed, show previous and after achievements
			index++;
			if (ceil(index / (columns * rows)) != pg)
				continue;
			for (var gr = 0; gr < array_length_1d(group); gr++) {
				if (group[gr] < i)
					ach_before[array_length_1d(ach_before)] = group[gr];
				else if (group[gr] > i)
					ach_after[array_length_1d(ach_after)] = group[gr];
			}
		}
	} else
		index++;
	if (ceil(index / (columns * rows)) != pg)
		continue;
	var name = scAchievementsGetType(ACHIEVEMENT_TYPE.NAME, i);
	var desc = scAchievementsGetType(ACHIEVEMENT_TYPE.DESCRIPTION, i);
	var icon = status != noone ? scAchievementsGetType(ACHIEVEMENT_TYPE.ICON, i) : s_achievement_Locked;
	var rx = ((RES_W / 3) + ((RES_W / 3) * index_on_page)) - ((y_offset) * ((RES_W / 3) * columns));
	var ry = y_offset * 150 + 150 + 30;
	var c = status != noone ? color_element : color_element_special;
	var ryo = 0;
	var hovering = false;
	if (scUIHovering(rx, ry + 25, name, x_buffer, 60, scale_element, fa_middle)) {
		c = color_main_hovering;
		ryo = scMovementWave(-3, 3, 1);
		hovering = true;
	}
	scDrawText(rx, ry, name, c, scale_element, noone, noone, noone, fa_bottom); //Achievement Name
	if (hovering && (status == noone || array_length_1d(ach_after) > 0)) { //hovering and locked show progress
		var tracking = array_length_1d(ach_after) > 0 ? 
			scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING_DESC, ach_after[0]) : 
			scAchievementsGetType(ACHIEVEMENT_TYPE.TRACKING_DESC, i);
		if (tracking != noone)
			scDrawText(rx, ry, string(tracking), c, scale_description, noone, noone, noone, fa_top); //Achievement Progress
		else
			scDrawText(rx, ry, desc, c, scale_description, noone, noone, noone, fa_top); //Achievement Desc
	} else {
		scDrawText(rx, ry, desc, c, scale_description, noone, noone, noone, fa_top); //Achievement Desc
	}
	scDrawSpriteExt(rx - 32, ry + 25 + ryo, icon, 0); //Icon
	if (array_length_1d(ach_before) != 0)
		for (var ach_bf = 0; ach_bf < array_length_1d(ach_before); ach_bf++)
			scDrawSpriteExt(rx - 66 - (34 * ach_bf), ry + 25 + ryo + 16, scAchievementsGetType(ACHIEVEMENT_TYPE.ICON, ach_before[ach_bf]), 0, noone, noone, 0.5, 0.5); //Icon after
	if (array_length_1d(ach_after) != 0)
		for (var ach_aft = 0; ach_aft < array_length_1d(ach_after); ach_aft++)
			scDrawSpriteExt(rx + 34 + (34 * ach_aft), ry + 25 + ryo + 16, s_achievement_Locked, 0, noone, noone, 0.5, 0.5); //Icon after
	scDrawLine(rx - 64, ry + 106, rx + 64, ry + 106, c_black, 2, 1); //Seperation line
	index_on_page++; //Succefully displayed achievement
	if (index_on_page mod columns == 0)
		y_offset++; //Offset every column
}

//var max_page = 0;
//while (amt - ((max_page + 1) * (columns * rows)) > 0)
//	max_page++;

scDrawText(RES_W - (RES_W / 8), RES_H - (RES_H / 8), "Page " + string(pg) + "/" + string(scAchievementsGetPages()), color_element, scale_element);

scDrawText(RES_W / 2, RES_H / 8 + (RES_H / 32), "ACHIEVEMENTS", c_orange, 1.5);