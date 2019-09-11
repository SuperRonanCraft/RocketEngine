/// @desc previous buffs page
var pg = page_achievements;

//Page flip
if (pg > 1) //PREV
	page_achievements--;
else
	page_achievements = scAchievementsGetPages();