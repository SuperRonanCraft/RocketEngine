/// @desc slide

if (!freezing) {
	if (ds_list_empty(frozen_walls))
		instance_destroy();
	exit;
}

vsp += grv * owner.time_dialation;
vsp = clamp(vsp, -30, 30);
hsp -= sign(hsp) * frc;
if (abs(hsp) < 0.5)
	hsp = 0;

//hit wall
var inst_list = ds_list_create();
instance_place_list(x + hsp, y, oWall, inst_list, false);
for (var i = 0; i < ds_list_size(inst_list); i++) {
	var inst = inst_list[| i];
	if (inst != noone && inst.object_index != oSeperator) {
		if (hsp > 0) //Going Right
			x = floor(inst.bbox_left + (x - bbox_right) - 1);
		else if (hsp < 0) //Going Left
			x = ceil(inst.bbox_right + (x - bbox_left) + 1);
		hsp = 0;
		break;
	}
}

ds_list_clear(inst_list);

//Slide on floor
instance_place_list(x, y + vsp + 1, oWall, inst_list, false);
touching_floor = false;
var wall_touching_y = noone;

for (var i = 0; i < ds_list_size(inst_list); i++) {
	var inst = inst_list[| i];
	if (inst != noone && inst.object_index != oSeperator) {
		if (vsp > 0) //Falling
			y = floor(inst.bbox_top + (y - bbox_bottom) - 1);
		else if (vsp < 0) //Going up
			y = ceil(inst.bbox_bottom + (y - bbox_top) + 1);
		vsp = 0;
		touching_floor = true;
		wall_touching_y = inst;
		break;
	}
}
ds_list_destroy(inst_list);
	
x += hsp * owner.time_dialation;
y += vsp * owner.time_dialation;

//Fade away
if (timer <= 0) {
	image_alpha -= alpha_change;
	if (image_alpha <= 0)
		freezing = false; //Dont freeze anymore
} else
	timer--;