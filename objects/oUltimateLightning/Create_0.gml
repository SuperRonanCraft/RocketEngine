/// @desc Lightning ult has been casted
owner = noone; //Owner of ult

light_range = 125;
light_branches = 10;
light_speed = 16 / (room_speed / 30);
light_target = RES_W / 2 + RES_W / 4;
light_current = 0;

first_draw = false;
timer = 7 * room_speed;
stopped = false;
damage_cooldown = 0;
damage_cooldown = 2 * room_speed;
damage_cooldown_cur = 0;
striking = noone;