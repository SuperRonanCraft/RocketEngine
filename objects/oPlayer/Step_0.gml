 /// @description Insert description here
// You can write your code in this editor
if (!global.play) exit;

scStateCheck();

//DEVMODE
if (global.devmode && global.debug)
	if (keyboard_check_pressed(keyshoot) && keyboard_check(keyjump)) {
		var newwep = rocket_map[? ROCKET_MAP.TYPE] + 1;
		if (newwep >= ROCKET.LENGHT)
			newwep = ROCKET.DEFAULT;
		scRocketChange(newwep);
	}

scKeybindsControls();
scCheckTech();

scBuffHandler();
scGravity();
scRocketProgress(team);
scUltimateHandler();
scComboStep();

scCheckHealth();
knockBackStep();

if (despawn && hp <= 0 && playerState == PLAYERSTATE.DEAD && vsp == 0) { //Despawn player object
	image_alpha -= 0.025;
	if (image_alpha <= 0)
		instance_destroy();
}