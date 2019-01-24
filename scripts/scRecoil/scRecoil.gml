///@desc Recoil from rocket shot
///@arg recoil amount

var amt = argument[0];
var currentAmt = amt*10;

recoilMAX = amt;

if(facing == 1){	
	recoilMAX *=-1;
}
