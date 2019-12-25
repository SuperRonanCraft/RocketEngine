///scAddToTeam(id,team)
///@arg id
///@arg team

var ent = argument[0];
var teamToCheck = argument[1];
var listTeam = noone;


//if(!variable_global_exists("teamPlayer")){
	//exit;
//}

if(teamToCheck == TEAM.LEFT){
	if(variable_global_exists("teamPlayer")){
		listTeam = 	global.teamPlayer;
	}
}
else if(teamToCheck == TEAM.RIGHT){
	if(variable_global_exists("teamEnemy")){
		listTeam = 	global.teamEnemy;
	}
}
else{
	if(variable_global_exists("teamNone")){
		listTeam = global.teamNone;	
	}
}

if(ds_exists(listTeam,ds_type_list)){
	if(ds_list_find_index(listTeam,ent) != -1){
		ds_list_delete(listTeam,ent);
	}
}

