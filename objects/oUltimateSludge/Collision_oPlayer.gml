/// @desc touched player, slow them down

if (standing && other.team != owner.team)
	//if (!scBuffFind(other, BUFFTYPE.SLIME)) //Cannot add all the time as the first clock event will not happen
	scBuffAdd(sludge_buff, other, owner);