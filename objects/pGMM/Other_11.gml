/// @desc Should be called from the (scHitShootable script)
var pamt = instance_number(oPlayer);
for (var i = 0; i < pamt; i++) {
	var p = instance_find(oPlayer, i);
	if (p.hp <= 0) {
		for (var a = 0; a < array_length_1d(global.winner); a++)
			if (global.winner[a] == p.team)
					global.winner[a] = noone;
		var index = array_length_1d(global.loser);
		global.loser[index == 0 ? 0 : index + 1] = p.team;
	} else {
		var index = array_length_1d(global.winner);
		global.winner[index == 0 ? 0 : index + 1] = p.team;
	}
}
endgame = true;
//End game sound...
//audio_play_sound(SOUND.GP_ENDGAME, 1, false);