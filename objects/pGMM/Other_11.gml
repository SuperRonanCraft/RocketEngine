/// @desc End the game (called from scHitShootable when a player hp <= 0) and when timer reaches 0

//Triggered once
if (endgame) exit;

endgame = true;
//Remove the ability to do damage
for (var i = 0; i < ds_list_size(p_list); i++) {
	var p = p_list[| i];
	p.damage_take = false; //Remove the ability to take damage
}
//End game sound...
with (oMusic)
	event_user(2);