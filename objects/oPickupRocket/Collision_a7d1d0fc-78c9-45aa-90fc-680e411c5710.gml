/// @desc Pickup item if any

if (current_item != noone) {
	with (other)
		scRocketChange(other.current_rocket); //Give rocket
	current_cooldown = cooldown; //Reset cooldown
	current_item = noone; //Reset item
}
