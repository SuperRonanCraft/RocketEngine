/// @desc Laser ult casted

owner = noone;

laser_uptime = 6 * room_speed; //Amount of time we should stay up (fade in time does not count)
laser_width = 2; //How tall the laser should be
laser_alpha = 0.5; //Transparency of beam
laser_damage_cooldown = room_speed / 2; //How much damage per second
laser_grow_speed = 0.04;

//Saved values
width_cur = 0; //Current width
growing = true; //Fading in?
timer = 0; //Internal up time
damage_cooldown_cur = 0; //Damage cooldown
first_draw = false; 
x2 = 0; //Side of beam
hitting = noone;