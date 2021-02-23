/// @description  

if(other.owner != owner && !destroy){
	scSpawnParticle(x, y, 5, 5, spDebris,WORLDPART_TYPE.DEBRIS);
	with(other)
		event_user(0);
	
}

