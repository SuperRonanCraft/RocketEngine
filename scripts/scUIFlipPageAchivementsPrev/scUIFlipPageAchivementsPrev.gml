/// @desc previous buffs page
var amt = ACHIEVEMENTS.SECTION, columns = 2, rows = 3;
var pg = page_achievements;

//Page flip
if (pg != 0) //PREV
	page_achievements -= 1;
else
	while (amt - (((page_achievements + 1) * (columns * rows)) + 1) > 0)
		page_achievements++;