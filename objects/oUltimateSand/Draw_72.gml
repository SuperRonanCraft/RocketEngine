/// @desc Check side from owner, spawn could on other side

if (checked) exit; //Already checked? Just cancel

//Check the side we are going to go to
if (owner.team != TEAM.LEFT) //False if left, true is right (target)
	side = true;

checked = true;