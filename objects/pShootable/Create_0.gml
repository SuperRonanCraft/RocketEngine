/// @description Insert description here
// You can write your code in this editor
hpscale = 1;
flash = 0;

enum SIDE {
	LEFT, RIGHT
}

//How to display the health
enum DISPLAYTYPE {
	NONE, BAR, SCREEN
}

//Default side to display health
side = SIDE.LEFT;

//Sprite the use as health
sprite = sHealth;
height = sprite_get_height(sprite);
width = sprite_get_width(sprite);

//Save the original health
hp_original = hp;