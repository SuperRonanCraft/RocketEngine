/// @description  Detect clicking on server list

var yindex = 40;
var count = ds_list_size(global.serverlist);
if mouse_y > 40 && mouse_y < (40 + (count * 30))
{
var picked = floor(((mouse_y - 40) / 30));
global.connectip = global.serverlist[| picked];
alarm[0] = 1;
}



