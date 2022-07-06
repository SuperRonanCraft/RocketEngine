/// @desc cycle item
if (!global.play) exit; //Dont start unless game has started

if (timer_current <= 0) {
	if(shuffle_on)
		item_weapon = irandom_range(0, WEAPON_MODIFIER.LENGTH - 1);
	item = scWeaponModifyGetType(item_weapon, WEAPON_MODIFIER_MAP.ICON);
	timer_current = timer_org; //Reset the timer
	timer = timer_org;
} else
	timer_current--;

