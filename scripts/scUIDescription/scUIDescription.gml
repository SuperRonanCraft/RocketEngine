/// @arg x
/// @arg y
/// @arg grid
/// @arg value
/// @arg index
function scUIDescription(argument0, argument1, argument2, argument3, argument4) {

	var xx = argument0;
	var yy = argument1;
	var grid = argument2;
	var value = argument3;
	var index = argument4;
	
	
	if (grid[# value, index] == 0) exit; //No text option
	if (grid[# value + 1, index] == -1) exit; //Show description
	var isDesc = is_array(grid[# 0, index]); //Is a normal description
	if (grid[# value + 1, index] != true && menu_option[page] != index && !isDesc) exit; //Always show description
	var string_val = grid[# value, index];
	var scale = scale_description;
	var c = color_element
	if (!isDesc)
		yy += 25;
	else {
		scale = scale_description_special;
		xx = start_x_default;
	}
	scDrawText(xx, yy, string_val, c, scale, noone, noone, centered ? fa_middle : fa_right);
	


}
