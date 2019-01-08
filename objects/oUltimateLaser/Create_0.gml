/// @desc Laser ult casted

owner = noone;
side = TEAM.LEFT;

laser_uptime = 5 * room_speed;
laser_width = 10;
laser_alpha = 0.5;
laser_damage_cooldown = 20;

//Saved values
width_cur = 0; //Current width
growing = true;
timer = 0;
damage_cooldown_cur = 0;
first_draw = false;
x2 = 0;