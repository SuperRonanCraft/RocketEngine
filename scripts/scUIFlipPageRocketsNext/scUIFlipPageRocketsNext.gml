/// @desc next buffs page
var amt = WEAPON_MODIFIER.LENGTH, columns = 2, rows = 3;
var pg = page_weapons;

//Page flip
if (amt - (((pg + 1) * (columns * rows)) + 1) > 0) //NEXT
	page_weapons++;
else
	page_weapons = 0;