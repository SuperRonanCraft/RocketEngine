function scAITest(){
	if(!instance_exists(aiTarget))
		exit;
	if(collision_line(player.x,player.y,aiTarget.x,aiTarget.y,oWall,false,true) == noone){
		scAICZombie(false);	
	}
	else{
		scAIStraightFindTo(aiTarget.x,aiTarget.y,player);
	}
}