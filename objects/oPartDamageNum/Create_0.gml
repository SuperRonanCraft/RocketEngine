/// @desc convert damage values to sprites

first_draw = false;
offset = sprite_width - 4;
value_damage = 0;
damage_type = DAMAGE_TYPE.NONE;
damage_took = DAMAGE_TOOK.HEALTH;
damage_killed = false;
combo = 0;
color = c_red;
value_cached = []; //Sprites in an array

angle = 0;
angle_change = 1;
angle_side = choose(-1, 1);
hsp = random_range(0, 5) * choose(-1, 1);
alpha = 1;
alpha_reduce = 0.05 / TIME_SPEED;
vsp = -(24 / TIME_SPEED) + random_range(0, 1);
grv = 1.125 / TIME_SPEED;
scale = 0;
scale_goal = 0.8;
scale_min = 0.3;
scale_max = 1.3;
//up_time = 0;