///scFindAITarget
function scFindAITarget() {

	var range = argument[0];

	var seeInvis = false;

	if(argument_count>1)
		seeInvis = argument[1];

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
			if(entity != undefined && instance_exists(entity)){
				if(entity.id != player.id && entity.player_map[?PLAYER_MAP.ALIVE]
					&& point_distance(player.x,player.y,entity.x,entity.y) < range
					&& (player.team == TEAM.NONE || entity.team != player.team)){
					
						if(!seeInvis && !scBuffFind(entity,BUFFTYPE.INVISIBLE)){
							aiTarget = entity;	
						}
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
				//show_debug_message("On my team");
			}
		}
	}



}
