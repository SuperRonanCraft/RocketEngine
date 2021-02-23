function scAchievementsGetPages() {

	var columns = 2, rows = 3;
	var amt = 0;
	for (var i = 0; i < ACHIEVEMENTS.SECTION; i++) {
		var group = scAchievementsGetType(ACHIEVEMENT_TYPE.GROUP, i);
		if (group != noone) //We are in a group
			if (group[0] != i) //First in the group
				continue;
		amt++;
	}
	return ceil(amt / (columns * rows));


}
