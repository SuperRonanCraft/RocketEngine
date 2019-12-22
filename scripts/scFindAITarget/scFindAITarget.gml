///scFindAITarget

var teamToOppose = noone;

if(player.team == TEAM.RIGHT){
	teamToOppose = global.teamPlayer;
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

	for (var i = 0; i < ds_list_size(teamToOppose); i++) {
    
		if(teamToOppose[i].player_map[?PLAYER_MAP.ALIVE]){
			aiTarget = teamToOppose[i];	
		}
	
	}

}

else if(aiTarget.player_map[?PLAYER_MAP.ALIVE]){
	aiTarget = noone;	
}
