if (!other.player_map[? PLAYER_MAP.ENABLED_PICKUP] || !global.play) exit;
//Add buff to player

if (item != noone) {
	scBuffAdd(item_buff, other, noone); //Give the buff
	delay_current = delay; //Delay a new spawn
	timer_current = 0;
	item = noone; //Reset item
	hacked = false;
}