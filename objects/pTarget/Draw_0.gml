/// @desc flash when shot
flash = scFlash(flash, false);
if (timer < 20)
	image_alpha = max(image_alpha * 0.95, 0);
else
	image_alpha = min(image_alpha + 0.05, 1);