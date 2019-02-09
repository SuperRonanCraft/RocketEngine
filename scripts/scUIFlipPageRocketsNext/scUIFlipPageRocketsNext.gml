/// @desc next buffs page
var amt = ROCKET.LENGHT, columns = 4, rows = 3;
var pg = page_rockets;

//Page flip
if (amt - (((pg + 1) * (columns * rows)) + 1) > 0) //NEXT
	page_rockets++;
else
	page_rockets = 0;