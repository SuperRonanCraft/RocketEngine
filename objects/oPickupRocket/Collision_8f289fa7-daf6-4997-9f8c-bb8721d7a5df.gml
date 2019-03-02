if (!other.pickups_enabled || !global.play) exit;
/// @desc Pickup item if any

if (item != noone) {
	with (other)
		scRocketChange(other.item_rocket); //Give rocket
	timer_current = timer_org; //Reset cooldown
	item = noone; //Reset item
	hacked = false;
}