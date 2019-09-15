/// @desc start tutorial

scDrawText(RES_W /2, RES_H /2, "Welcome to \nRocketMan!", noone, 2);

if (player_action_time > 300) {
	player_action = noone;
	player_action_time = 0;
	tutorial_part++;
}