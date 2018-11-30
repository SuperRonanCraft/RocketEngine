/// @desc Game End cooldown has stopped, identify loser and winner
// Only runs once

var p1 = p_list[| 0];
var p2 = oTargetBomb;
if (!instance_exists(oTargetBomb))
	instance_create_depth(0, 0, depth, p2);

if (p1.hp > 0) {
	global.winner = p1.team;
	global.loser = p2.team;
} else {
	global.winner = p2.team;
	global.loser = p1.team;
}

//Hick back to main screen
alarm_set(0, 300);
//Variable to allow showing winners and losers text
calculated = true;
global.play = false;
		
//Print out winner

scData_PrintOutcome();
