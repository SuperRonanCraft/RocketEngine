///@desc Recoil from rocket shot
///@arg recoil amount

var amt = argument[0];

recoilMAX = amt;

if (facing == 1)
	recoilMAX *= -1;