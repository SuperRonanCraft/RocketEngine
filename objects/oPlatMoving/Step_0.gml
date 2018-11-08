if (x != x_original)
	if (x > (x_original + x_max) || x < (x_original - y_max))
		x_speed = -x_speed;
if (y != y_original)
	if (y > (y_original + y_max) || y < (y_original - y_max))
		y_speed = -y_speed;
x += x_speed;
y += y_speed;
with (mywall) {
	x = other.x;
	y = other.y;
}