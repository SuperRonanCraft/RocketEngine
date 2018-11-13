/// @desc flash when shot
if (timer < 20)
	image_alpha = max(image_alpha * 0.95, 0);
else
	image_alpha = min(image_alpha + 0.05, 1);
if (flash > 0) {
	flash = scFlash(flash, false);
	if (!flashing) {
		image_alpha = 1;
		timer = 30;
		flashing = true;
	}
} else
	draw_self();