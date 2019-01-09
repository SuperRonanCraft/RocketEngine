 /// @description Insert description here
// You can write your code in this editor
if (!global.play) exit;

scStateCheck();
scKeybindsControls();
scCheckTech();
event_inherited();
scCheckHealth();
knockBackStep();

if (despawn && hp <= 0 && playerState == PLAYERSTATE.DEAD && vsp == 0) { //Despawn player object
	image_alpha -= 0.025;
	if (image_alpha <= 0)
		instance_destroy();
}