/// @arg multiplier

//Delay between each pickup spawn
cooldown = 5 * room_speed;

switch (argument0) {
	case 0: cooldown = -1; break;
	case 1: break;
	case 2: cooldown /= 10; break;
}

current_cooldown = cooldown;