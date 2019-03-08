/// @arg file-type FILES.<VALUE>
switch (argument0) {
	case FILES.DATABASE: return "Database.sav";
	case FILES.SETTINGS: return "Settings.sav";
	case FILES.ACHIEVEMENTS: return "Achievements.sav";
}

enum FILES {
	DATABASE, SETTINGS, ACHIEVEMENTS
}
