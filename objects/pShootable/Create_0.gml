/// @desc 

//Health
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
