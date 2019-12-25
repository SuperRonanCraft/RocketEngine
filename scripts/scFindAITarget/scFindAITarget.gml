///scFindAITarget

var teamToOppose = noone;

if(player.team == TEAM.RIGHT){
	teamToOppose = global.teamPlayer;
	show_debug_message("Looking for team player");
}
else if(player.team == TEAM.LEFT){
	teamToOppose = global.teamEnemy;	
}
else{
	var randTeam = irandom_range(1,3);
	if(randTeam == 3){
		teamToOppose = global.teamPlayer;	
	}
	else if(randTeam == 2){
		teamToOppose = global.teamEnemy	
	}
	else{
		teamToOppose = global.teamNone;	
	}
	
}

if(aiTarget == noone){
	show_debug_message("Looking for target");
	for (var i = 0; i < ds_list_size(teamToOppose); i++) {
		var entity = teamToOppose[|i];
		if(instance_exists(entity)){
			if(entity.player_map[?PLAYER_MAP.ALIVE]){
				aiTarget = teamToOppose[|i];	
				show_debug_message("Has target");
			}
		}
	
	}

}

else if(!aiTarget.player_map[?PLAYER_MAP.ALIVE]){
	aiTarget = noone;
	show_debug_message("player dead");
}
