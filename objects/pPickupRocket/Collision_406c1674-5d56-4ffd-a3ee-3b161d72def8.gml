/// @desc Pickup item if any

if (current_rocket != noone) {
	with (other)
		scRocketChange(other.current_rocket_type); //Give rocket
	current_cooldown = cooldown; //Reset cooldown
	//current_delay = delay; //Delay a new spawn
	current_rocket = noone; //Reset item
}