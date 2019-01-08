/// @desc Laser ult casted

owner = noone;
side = TEAM.LEFT;

laser_uptime = 3 * room_speed;
laser_width = 10;
laser_alpha = 0.5;
laser_damage_cooldown = room_speed / 2;

//Saved values
width_cur = 0; //Current width
growing = true;
timer = 0;
damage_cooldown_cur = 0;
first_draw = false;
x2 = 0;