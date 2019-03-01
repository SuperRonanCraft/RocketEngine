// @arg other (rocket)
var oth = argument0;
with (oth)
	ds_list_add(hitList, other.owner); //Force the player to already have "been" hit
event_user(0);