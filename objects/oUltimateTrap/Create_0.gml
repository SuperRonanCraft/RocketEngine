/// @desc 

owner = noone;
uptime = 5 * room_speed; //Time in seconds to stay "open"
uptime_trapped = 2 * room_speed; //Amount of time to trap someone

//Movement
trap_hsp = 10;
trap_vsp = -4;
trap_grv = 0.4;

standing = false; //Are we able to trap
trapped = noone; //The player trapped
trapped_hp = 0; //The player that is trapped hp value
image_speed = 0;
first_step = false;
timer = 0; //Internal timer
timer_trapped = 0; //Internal trapped timer