//mask_index = sPlatform;
if (x != x_original)
	if (x > (x_original + x_max) || x < (x_original - y_max))
		hsp = -hsp;
if (y != y_original)
	if (y > (y_original + y_max) || y < (y_original - y_max))
		vsp = -vsp;
x += hsp;
y += vsp;
//with (mywall) {
//	x = other.bbox_left;
//	y = other.bbox_top;
//	hsp = other.x_speed;
//	vsp = other.y_speed;
//	x = other.x;
//	y = other.y;
//}
//Add horizontal speed to player

var list = ds_list_create();
var obj = instance_place_list(x, y - 1, oPlayer, list, true);
if (obj > 0)
	for (var i = 0; i < obj; i++)
		with (list[| i]) {
			hsp_carry = other.hsp;
			vsp_carry = other.vsp;
		}
ds_list_destroy(list);