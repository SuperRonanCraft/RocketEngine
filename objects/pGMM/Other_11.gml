/// @desc Player died? Are there more on their team alive?
// No? Declare who won, go to stage select
/// @arg player-inst

//var player = argument0

for (var i = 0; i < ds_list_size(global.team1); i++) {
	var ds_map = global.team1[| i];
	if (ds_map[? TEAM.PLAYER] == player)
		exit; //PLAYER DIED
}