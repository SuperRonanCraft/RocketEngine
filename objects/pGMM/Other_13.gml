/// @desc Game End cooldown has stopped, identify loser and winner
// Only runs once

if (ds_list_size(p_list) == 2) {
	var p1 = p_list[| 0];
	var p2 = p_list[| 1];
	//Check if their hp is the same
	tie = (p1.hp == p2.hp);
	if (!tie)
		if (p1.hp > p2.hp) {
			global.winner = p1.team;
			global.loser = p2.team;
		} else {
			global.winner = p2.team;
			global.loser = p1.team;
		}
} else if (ds_list_size(p_list) == 1) {
	//Probably dont need to check size for 1v1 games, just set a winner for now
	global.winner = p_list[| 0].team;
}

//Hick back to main screen
alarm_set(0, 300);
//Variable to allow showing winners and losers text
calculated = true;
global.play = false;
		
//Print out winner

scData_PrintOutcome();