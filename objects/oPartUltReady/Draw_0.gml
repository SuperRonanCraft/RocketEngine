
scDrawText(x, y, "Ultimate ready!", c_yellow, 0.5, noone, alpha);
y -= speed_y;
alpha = max(alpha - alpha_reduce, 0);

if (alpha <= 0)
	instance_destroy();