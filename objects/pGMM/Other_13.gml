/// @desc Game End cooldown has stopped, identify loser and winner
var pamt = instance_number(oPlayer);
var maxhp = 0;
for (var i = 0; i < pamt; i++) {
	var p = instance_find(oPlayer, i);
	if (p.hp <= 0) {
		//for (var a = 0; a < array_length_1d(global.winner); a++)
		//	if (global.winner[a] == p.team)
		//			global.winner[a] = noone;
		var index = array_length_1d(global.loser);
		global.loser[index == 0 ? 0 : index + 1] = p.team;
	} else
		maxhp = p.hp;
}
for (var i = 0; i < pamt; i++) {
	var p = instance_find(oPlayer, i);
	if (maxhp == p.hp) {
		var index = array_length_1d(global.winner);
		global.winner[index == 0 ? 0 : index + 1] = p.team;
	} else if (array_length_1d(global.loser) == 0) {
		var index = array_length_1d(global.loser);
		global.loser[index == 0 ? 0 : index + 1] = p.team;
	}
		
}
//Hick back to main screen
alarm_set(0, 300);
calculated = true;