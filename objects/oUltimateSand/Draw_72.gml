/// @desc Check side from owner, spawn could on other side

if (checked) exit; //Already checked? Just cancel

//Check the side we are going to draw on
if (owner.team != TEAM.LEFT)
	side = true;

//Setup the cloud side
xpos1 = side ? 0 : RES_W; xpos2 = RES_W / 2;

checked = true;