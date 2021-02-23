/// @desc pickup weapon

if (item_destroy || item_pickup_delay > 0)
	exit;
	
with (other)
	if (system_inventory) {
		other.item_map = scItemPickup(other.item_map);
		if (other.item_map == noone || other.item_map[? ITEM_MAP.AMOUNT] <= 0)
			other.item_entity_picked = id;
	}

if (item_map == noone || item_map[? ITEM_MAP.AMOUNT] <= 0) 
	item_destroy = true;