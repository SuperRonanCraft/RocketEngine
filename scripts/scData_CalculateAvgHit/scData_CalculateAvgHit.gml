///@desc Calculate mean hit time

with(oDataCollector){
	
	avgTime = 0;
	for (var t = 0; t < ds_list_size(timeToHit); t++) {
	    
		avgTime += timeToHit[| t];
		
		
	}	
	avgTime /= ds_list_size(timeToHit);
	avgTime /= game_get_speed(gamespeed_fps);
	
}

scAddData("AVG. HIT TIME: " + string(oDataCollector.avgTime) + "s");