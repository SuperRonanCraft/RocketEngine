if (!other.pickups_enabled || !global.play) exit;
/// @desc Pickup item if any

if (item != noone) {
	with (other)
		scRocketChange(other.item_rocket); //Give rocket
	timer_current = timer; //Reset cooldown
	item = noone; //Reset item
}