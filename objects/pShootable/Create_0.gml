/// @desc 

//Health
hp = 10;
if (global.gamemode == GAMEMODE.ONEVONE)
	switch (global.mode_extrahealth) {
		case 0: break;
		case 1: hp *= 2; break;
		case 2: hp *= 5; break;
		case 3: hp *= 10; break;
	}
hp_original = hp;
hp_scale = 1;
hpsprite = sHealth;
hpheight = sprite_get_height(hpsprite);
hpwidth = sprite_get_width(hpsprite);
display = true; //Display gui stuff

//Show when hit
flash = 0;

//Load Rockets
scRocketStart(starting_weapon);

//Load Ultimates
scUltimateStart();

//Load Combos
scComboStart();

//Buffs/Debuffs setup
scBuffStart();

damage_take = true; //Ability to take damage
