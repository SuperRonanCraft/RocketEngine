/// @desc next buffs page
var amt = BUFFTYPE.LENGHT, columns = 3, rows = 3;
var pg = page_buffs;

//Page flip
if (amt - ((pg + 1) * (columns * rows)) > 0) //NEXT
	page_buffs += 1;
else
	page_buffs = 0;