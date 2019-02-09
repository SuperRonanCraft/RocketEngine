/// @desc previous buffs page
var amt = ROCKET.LENGHT, columns = 4, rows = 3;
var pg = page_rockets;

//Page flip
if (pg != 0) //PREV
	page_rockets -= 1;
else
	while (amt - (((page_rockets + 1) * (columns * rows)) + 1) > 0)
		page_rockets++;