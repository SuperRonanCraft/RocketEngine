function scPlayerCharacterGet() {
	var val = CHARACTER.DEFAULT;

	for (var i = 0; i < instance_number(object_index); i++)
		if (instance_find(object_index, i) == self)
			switch (i) {
				case 0:
					val = scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_1_CHARACTER);
					break;
				case 1:
					val = scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_2_CHARACTER);
					break;
				case 2:
					val = scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_3_CHARACTER);
					break;
				case 3:
					val = scSettingsGetType(SETTINGS_TYPE.VALUE, SETTINGS.PLAYER_4_CHARACTER);
					break;
				default: show_debug_message("NO PLAYER #" = string(i + 2)); break;
			}
	//show_debug_message("GETTING PLAYER CHARACTER " + string(val));
	return val;


}
