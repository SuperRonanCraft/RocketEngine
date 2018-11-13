///@desc Return the buff script used for executing the buff step
///@arg buffMap The DS Map to attach the script to
///@arg name The name of the buff to look for

//Initialize variables
var buffMap = argument0;
var buffName = argument1;

//Switch statement to easily attach script
switch (buffName) {
	default:
		return noone;
		break;
		
    case "Chilled":
        return scBuff_Chilled;
        break;
}