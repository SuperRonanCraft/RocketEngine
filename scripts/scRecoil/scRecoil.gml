///@desc Recoil from rocket shot
///@arg recoil amount

var amt = argument[0];
var currentAmt = amt*10;

recoilKB = -currentAmt;

if(facing == -1)	
	recoilKB *=-1;
