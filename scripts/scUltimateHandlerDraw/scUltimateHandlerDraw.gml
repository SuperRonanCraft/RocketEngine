if (!ult_enabled || !global.play) exit; //Is the system even enabled?
if (ult_casting && global.play)
	if (ult_casting_draw != noone)
		script_execute(ult_casting_draw);

if (ult_casted_draw != noone) {
	script_execute(ult_casted_draw);
	ult_casted_draw = noone;
}