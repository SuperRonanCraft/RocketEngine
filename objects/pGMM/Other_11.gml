/// @desc Should be called from the (scHitShootable script)
var pamt = instance_number(oPlayer);
for (var i = 0; i < pamt; i++) {
	var p = instance_find(oPlayer, i);
	if (p.hp <= 0)
		global.loser = p.team;
	else
		global.winner = p.team;
}
endgame = true;
//End game sound...
//audio_play_sound(SOUND.GP_ENDGAME, 1, false);