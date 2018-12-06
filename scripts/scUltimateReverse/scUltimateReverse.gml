/// @desc Reverse ultimate

//Amount of oPlayer instances
var amt = instance_number(oPlayer);

//If player is not part of the team, give them the debuff
for (var i = 0; i < amt; i++) {
	var p = instance_find(oPlayer, i);
	if (p.team != team)
		scAddBuff(BUFFTYPE.REVERSECONTROLS, p);
}