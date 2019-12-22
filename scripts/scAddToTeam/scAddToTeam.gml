///scAddToTeam(id,team)
///@arg id
///@arg team

var ent = argument[0];
var teamToCheck = argument[1];

if(ds_exists(teamToCheck,ds_type_list)){
	if(ds_list_find_index(teamToCheck,ent) == -1){
		ds_list_add(teamToCheck,ent);
	}
}

