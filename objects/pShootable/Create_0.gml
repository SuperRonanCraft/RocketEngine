/// @desc 

//Health
hp_original = hp;
hpscale = 1;
hpsprite = sHealth;
hpheight = sprite_get_height(hpsprite);
hpwidth = sprite_get_width(hpsprite);

//Show when hit
flash = 0;

//How to display the health
enum DISPLAYTYPE {
	NONE, BAR, SCREEN
}