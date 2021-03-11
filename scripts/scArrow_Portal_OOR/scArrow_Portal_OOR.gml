// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scArrow_Portal_OOR(){
	if(!variable_instance_exists(id, "ported"))
		ported = 0;
	
	if(ported == 0){
		if(x > room_width)
			x = 0;
		else if(x < 0)
			x = room_width;
		if(y > room_height)
			y = 0;
		else if(y < 0)
			y = room_height;
		
		ported++;
	}
	else
		instance_destroy();
	
}