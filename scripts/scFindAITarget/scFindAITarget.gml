///scFindAITarget

var teamToOppose = noone;

if(player.team == TEAM.RIGHT){
	var randTeam = irandom_range(1,2);
	if(randTeam == 1 && !ds_list_empty(global.teamPlayer)){
		teamToOppose = global.teamPlayer;
	}
	else{
		teamToOppose = global.teamNone;
	}
}
else if(player.team == TEAM.LEFT){
	var randTeam = irandom_range(1,2);
	if(randTeam == 1 && !ds_list_empty(global.teamEnemy)){
		teamToOppose = global.teamEnemy;
	}
	else{
		teamToOppose = global.teamNone;
	}
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
	for (var i = irandom_range(0,ds_list_size(teamToOppose)-1); i < ds_list_size(teamToOppose); i++) {
		var entity = teamToOppose[|i];
		if(instance_exists(entity)){
			if(entity.id != player.id && entity.player_map[?PLAYER_MAP.ALIVE]
				&& (player.team == TEAM.NONE || entity.team != player.team)){
				aiTarget = entity;	
			}
		}
	
	}

}

else{
	if(!instance_exists(aiTarget)){
		aiTarget = noone;	
	}
	else{
		if(!aiTarget.player_map[?PLAYER_MAP.ALIVE]){
			aiTarget = noone;
		}
		else if(aiTarget.team == player.team && player.team != TEAM.NONE){
			aiTarget = noone;	
			show_debug_message("On my team");
		}
		else if(point_distance(player.x,player.y,aiTarget.x,aiTarget.y) > 500){
			aiTarget = noone;	
		}
	}
}
