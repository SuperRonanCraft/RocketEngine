/// @desc explosion step

//Custom cancel var
if (intercept[? "cancelled"]) exit;

if  (!destroy && (intercept[? "timer"] > intercept[? "clock"])) {
	intercept[? "clock"]++;
	if (!intercept[? "setWall"]) {
		with (intercept[? "wall"]) {
			image_alpha = 0.5;
		}
		intercept[? "setWall"] = true;
	}
} else {
	with (intercept[? "wall"]) {
			image_alpha = 1;
		}
	destroy = true;
	ds_map_destroy(intercept);
}