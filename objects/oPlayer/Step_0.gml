/// @description Insert description here
// You can write your code in this editor
if (!global.play) exit;
scBuffHandler();
scGravity();
scKeybindsControls();
scRocketProgress(playerid);

if(standing){
	sprite_index = sPlayer_idle;

}
else if(vsp > 0){
	sprite_index = sPlayer_fall;
}
else if(vsp < 0){
	sprite_index = sPlayer_rise;	
}