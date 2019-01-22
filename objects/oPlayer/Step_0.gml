 /// @description Insert description here
// You can write your code in this editor
if (!global.play) exit;

scStateCheck();

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
		scBuffAdd(buffs_cur, id);
	} else if (keyboard_check_pressed(vk_f5)) {
		if (buffs_cur >= 0)
			scBuffAdd(buffs_cur, id);
	}

scKeybindsControls();
scCheckTech();

scBuffHandler();
scGravity();
scRocketProgress(!shoot_face ? team : -1);
scUltimateHandler();
scComboStep();

scCheckHealth();
knockBackStep();

if (despawn && hp <= 0 && playerState == PLAYERSTATE.DEAD && vsp == 0) { //Despawn player object
	image_alpha -= 0.025;
	if (image_alpha <= 0)
		instance_destroy();
}