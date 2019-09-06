 /// @description Insert description here
// You can write your code in this editor
if (!global.play) exit;

//scPlayerHandler(PLAYER_EVENT.STEP);

scStateCheck();

//--------
//DEVMODE 
//JUMP + KEYSHOOT = CHANGE ROCKET
//JUMP + F5 = CHANGE AND APPLY BUFF
//JUMP + F6 = APPLY BUFF
if (global.devmode && global.debug && keyboard_check(keyjump))
	if (keyboard_check_pressed(keyshoot)) {
		var newwep = rocket_map[? ROCKET_MAP.TYPE] + 1;
		if (newwep >= ROCKET.LENGHT)
			newwep = ROCKET.DEFAULT;
		scRocketChange(newwep);
	} else if (keyboard_check_pressed(vk_f5)) {
		buffs_cur++;
		if (buffs_cur >= BUFFTYPE.LENGHT)
			buffs_cur = 0;
		scBuffAdd(buffs_cur, id, id);
	} else if (keyboard_check_pressed(vk_f6)) {
		if (buffs_cur >= 0)
			scBuffAdd(buffs_cur, id, id);
	}
//--------

scKeybindsControls();
scCheckTech();

//Buff step handler
scBuffHandler(BUFF_EVENT.STEP);

//Collision
scGravity();

//Weapon activate
scWeaponProgress();

//Combo handling (alters ultimate charge)
scComboStep();

//Ultimate step handler
scUltimateHandler();

//Check health
scCheckHealth();

//Knockback handling
scKnockback();

//Mostly meant for clones
if (despawn && ((playerMap[? PLAYER_MAP.HEALTH] <= 0 && playerMap[? PLAYER_MAP.PLAYER_STATE] == PLAYERSTATE.DEAD && vsp == 0) || image_alpha != 1)) { //Despawn player object
	image_alpha -= 0.025;
	if (image_alpha <= 0)
		instance_destroy();
}
