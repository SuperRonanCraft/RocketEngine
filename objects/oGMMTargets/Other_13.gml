/// @desc Game End cooldown has stopped, identify loser and winner
// Only runs once

var p1 = p_list[| 0];
var p2 = instance_create_depth(0, 0, depth, oTargetBomb);

if (p1.hp > 0) {
	global.winner = p1.team;
	global.loser = p2.team;
} else {
	global.winner = p2.team;
	global.loser = p1.team;
}

//Kick back to main screen
//alarm_set(0, 300);
//Variable to allow showing winners and losers text
calculated = true;
global.play = false;
		
//Save winner
scStatsSavePoints();
