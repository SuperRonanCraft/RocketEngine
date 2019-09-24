/// @desc TEST PALETTE CHANGE

index_pallete++;
if (index_pallete > sprite_get_width(sPallete_sword) - 1)
	index_pallete = 0;
scShootableHeal(id, 56, true, false);