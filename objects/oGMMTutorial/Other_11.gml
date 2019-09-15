/// @desc movement
if (player_action_time < 10)
	player_action = ACTIONS.RIGHT;
else {
	player_action = noone;
	player_action_time = 0;
	tutorial_part++;
}