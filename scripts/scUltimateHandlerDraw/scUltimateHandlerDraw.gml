if (!ult_enabled) exit; //Is the system even enabled?
if (ult_casting)
	if (ult_casting_draw != noone)
		script_execute(ult_casting_draw);