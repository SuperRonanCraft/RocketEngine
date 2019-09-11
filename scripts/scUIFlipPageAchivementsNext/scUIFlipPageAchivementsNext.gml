/// @desc next achievements page
var pg = page_achievements;

//Page flip
if (pg < scAchievementsGetPages()) //NEXT
	page_achievements++;
else
	page_achievements = 1;