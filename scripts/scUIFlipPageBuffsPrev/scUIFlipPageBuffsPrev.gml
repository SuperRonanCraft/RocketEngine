/// @desc previous buffs page
var amt = BUFFTYPE.LENGHT - 1, columns = 3, rows = 3;
var pg = page_buffs;

//Page flip
if (pg != 0) //PREV
	page_buffs -= 1;
else
	while (amt - ((page_buffs + 1) * (columns * rows)) > 0)
		page_buffs++;

if (pg != page_buffs)
	scParticlesClear();