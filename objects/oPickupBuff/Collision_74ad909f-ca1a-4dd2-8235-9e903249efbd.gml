if (!other.pickups_enabled || !global.play) exit;
//Add buff to player

if (item != noone) {
	scBuffAdd(item_buff, other); //Give the buff
	delay_current = delay; //Delay a new spawn
	timer_current = 0;
	item = noone; //Reset item
	hacked = false;
}