/// @desc convert damage values to sprites

first_draw = false;
offset = sprite_width;
value_damage = 0;
damage_type = DAMAGETYPE.DIRECT;
damage_killed = false;
color = c_red;
value_cached = []; //Sprites in an array

angle = 0;
angle_change = 1;
angle_side = choose(-1, 1);
hsp = random_range(3, 5) * choose(-1, 1);
alpha = 1;
alpha_reduce = 0.075 / TIME_SPEED;
vsp = -(20 / TIME_SPEED) + random_range(-3, 6);
grv = 1.2 / TIME_SPEED;
scale = 0.8;