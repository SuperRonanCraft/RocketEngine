///@desc Recoil from rocket shot
///@arg recoil amount
function scShootableRecoil() {

	var amt = argument[0];

	recoilMAX = amt;

	if (facing == 1)
		recoilMAX *= -1;


}
