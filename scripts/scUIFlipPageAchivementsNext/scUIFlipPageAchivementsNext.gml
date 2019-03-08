/// @desc next buffs page
var amt = ACHIEVEMENTS.SECTION, columns = 2, rows = 3;
var pg = page_achievements;

//Page flip
if (amt - (((pg + 1) * (columns * rows)) + 1) > 0) //NEXT
	page_achievements++;
else
	page_achievements = 0;