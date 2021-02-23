/// @arg file-type FILES.<VALUE>
function scFileGetType(argument0) {
	switch (argument0) {
		case FILES.DATABASE: return "Database.sav";
		case FILES.SETTINGS: return "Settings.sav";
		case FILES.ACHIEVEMENTS: return "Achievements.sav";
	}

	enum FILES {
		DATABASE, SETTINGS, ACHIEVEMENTS
	}



}
