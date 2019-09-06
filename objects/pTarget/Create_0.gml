/// @desc Initiation
event_inherited();
owner = noone;
timer = 120 * TIME_SPEED;
//timer_original = timer;
x = RES_W - irandom_range(50, 350);
y = irandom_range(75, RES_H - 75);
image_alpha = 0;
checked = false;
alpha_reduction = 0.15 * (room_speed / 30);
rockets_hit = false;