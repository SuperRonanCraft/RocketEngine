/// @description Insert description here
// You can write your code in this editor
myhealth = instance_create_layer(x, y, layer, oHealth);
with (myhealth) {
	if (other.object_index == oPlayer)
		display = DISPLAYTYPE.SCREEN;
	else
		display = DISPLAYTYPE.BAR;
	hp = other.hp;
	//code to indicate which corner of screen
}