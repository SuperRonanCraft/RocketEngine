/// @desc Lightning ult has been casted
owner = noone; //Owner of ult

light_range = 150;
light_branches = 10;
light_speed = 16 / TIME_SPEED;
light_target = RES_W / 2 + RES_W / 4;
light_current = 0;

dmg = 1;
first_draw = false;
timer = 5 * room_speed;
stopped = false;
damage_cooldown = 0;
damage_cooldown = 1 * room_speed * .1;
damage_cooldown_cur = 0;
striking = noone;