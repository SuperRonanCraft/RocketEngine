//Actual movement (overwritten)
hsp = 0;
vsp = 0;
//Platforms
hsp_carry = 0;
vsp_carry = 0;
//Movement by keybinds
hsp_move = 0;
vsp_move = 0;
//movement override
hsp_override = 0;
vsp_override = 0;
//Movement by buffs/debuffs
move_adj = 0;
jump_adj = 0;
//Set whenever the player is on the ground
standing = false;
//Knockback effects
hsp_knockback = 0;
vsp_knockback = 0;
knockback_time = 0;

//Specials
player_tech = true; //Remove the bounce and teching
player_knockback = true; //Remove knockback all together

grv_dir = 1; //Gravity direction (1 = down, 0 = none, -1 = up)