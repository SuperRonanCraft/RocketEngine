/// @arg x
/// @arg y
/// @arg grid
/// @arg value
/// @arg index

var xx = argument0;
var yy = argument1;
var grid = argument2;
var value = argument3;
var index = argument4;

if (grid[# value, index] == 0) exit; //No text option
if (grid[# value + 1, index] != true && menu_option[page] != index) exit; //Always show description
var string_val = grid[# value, index];
scDrawText(xx, yy + 25, string_val, color_element, scale_description, noone, noone, centered ? fa_middle : fa_right);