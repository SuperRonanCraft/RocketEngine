/// @desc convert damage values to sprites

first_draw = false;
offset = 10;
value_damage = 0;
damage_type = DAMAGETYPE.DIRECT;
color = c_red;
value_cached = []; //Sprites in an array

//angle = 0;
//angle_change = 1;
//angle_side = choose(-1, 1);
hsp = random_range(0, 5) * choose(-1, 1);
alpha = 1;
alpha_reduce = 0.075 / TIME_SPEED;
vsp = -(20 / TIME_SPEED);
grv = 1.2 / TIME_SPEED;