
selected = true;
var all_selected = true;

with (object_index)
	if (!selected)
		all_selected = false;

if (all_selected) {
	with (pGMM)
		timer_enabled = true;
	with (object_index)
		instance_destroy();
	with (oPlayer)
		image_alpha = 1;
}