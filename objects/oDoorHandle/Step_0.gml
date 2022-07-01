/// @description  
if(activated && array_length(toKill) > 0){
	for (var i = 0; i < array_length(enemies); i++) {
	    if(instance_exists(toKill[i])) exit;
	}
	for (var i = 0; i < array_length(enemiesBoss); i++) {
	    if(instance_exists(toKill[i])) exit;
	}
	show_debug_message(string(section_id) + " Section done!");
	activated = false;
	for (var i = 0; i < instance_number(oDoor); i++) {
		if(instance_find(oDoor,i).section_id == section_id) instance_find(oDoor,i).activated = false;
	}	
	
	if(final_boss){
		oGMMSingle.win = true;
		with(oGMMSingle)
			event_user(1);
	}
}


