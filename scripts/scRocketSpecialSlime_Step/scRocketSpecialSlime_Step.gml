/// @desc custom rocket slime step script
//Step scripts dont have arguments

//sine wave script?
//No, SLIME wave script
//haha

x += lengthdir_x(rocket_map[? ROCKET_MAP.SPEED], direction);
//show_debug_message(x);
y = y + (5 * -cos(1.25 * (slimeClock / 5)));
//show_debug_message(y);

slimeClock++;