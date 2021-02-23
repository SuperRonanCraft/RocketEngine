/// @desc previous buffs page
function scUIFlipPageWeaponPrev() {
	var amt = WEAPON_MODIFIER.LENGTH, columns = 2, rows = 3;
	var pg = page_weapons;

	//Page flip
	if (pg != 0) //PREV
		page_weapons -= 1;
	else
		while (amt - (((page_weapons + 1) * (columns * rows)) + 1) > 0)
			page_weapons++;


}
