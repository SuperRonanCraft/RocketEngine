/// @arg gamemode
/// @arg player

var val = scStatsGet(argument0, argument1);

var str = string(val); 
/*var l = string_length(str);
var n = floor((l - 1) / 3);
var i = 0;

//Draw Event
while(string_length(str) < (l + n)) {
   str = string_insert(",", str, l - 2 - (i * 3));
   i++;
}*/

return str;