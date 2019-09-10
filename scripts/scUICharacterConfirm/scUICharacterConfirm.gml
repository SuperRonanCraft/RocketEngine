//@arg force-confirm
var force = argument[0];

selected = true;
var all_selected = true;

with (object_index)
	if (!selected)
		all_selected = false;

if (all_selected || force) {
	if (force)
		with (oPlayer) { //random character
			var val = irandom_range(0, CHARACTERS.LENGTH - 1);
			scPlayerCharacterChange(val);
		}
	with (pGMM)
		timer_enabled = true;
	with (object_index)
		instance_destroy();
	with (oPlayer)
		image_alpha = 1;
}