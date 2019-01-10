/// @desc

//Fade out
var offset = growing ? scMovementWave(2, -2, 1) : 0;
//scDrawCircle(x, y, (laser_width * (!growing ? (width_cur / laser_width): 1)) + offset, c_aqua, false, 1);
//Draw laser to other enemy side
var width = (width_cur / 2) + offset;

//Beggining
draw_sprite_ext(sprite_index, 0, x, y + offset, image_xscale, width_cur, 0, c_white, laser_alpha);

//Middle
hitting = noone;
var closest = RES_W; //Closest player to laser
var list = ds_list_create();

//Find the closest player
collision_rectangle_list(x, y - width, x2, y + width, oPlayer, false, false, list, false);
for (var i = 0; i < ds_list_size(list); i++) {
	var p = list[| i];
	if (p != owner && abs(x - p.x) < closest) //Not the same player as shot
		hitting = p;
}
ds_list_destroy(list);

var dis = hitting != noone ? abs(x - hitting.x) : abs(x - x2);
var width = abs(sprite_width);
var xoffset = image_xscale * width;
var xx = 0;
var amt = floor(dis / width)
for (var i = 0; i < amt; i++) {
	if (i == amt - 1) {
		var val = image_xscale * (dis mod 32);
		draw_sprite_part_ext(sprite_index, 1, 0, 0, abs(val), sprite_height, x + xx + (val - ((width / 2) * (image_xscale * -1))), y - ((sprite_height * width_cur) / width_cur) + offset, 1, width_cur, c_white, laser_alpha);
		xx += val;
	} else {
		xx += xoffset;
		draw_sprite_ext(sprite_index, 1, x + xx, y + offset, 1, width_cur, 0, c_white, laser_alpha);
	}
}

//End
draw_sprite_ext(sprite_index, 2, x + xx + xoffset, y + offset, image_xscale, width_cur, 0, c_white, laser_alpha);
