/// @desc 

//Health
hp_original = hp;
hpscale = 1;
hpsprite = sHealth;
hpheight = sprite_get_height(sprite);
hpwidth = sprite_get_width(sprite);

//Show when hit
flash = 0;

//How to display the health
enum DISPLAYTYPE {
	NONE, BAR, SCREEN
}