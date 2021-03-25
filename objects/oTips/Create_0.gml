/// @desc Tips object has been spawned

enum tip_element {
	sprite, //Display a sprite, title and desc [type, sprite, title, desc, scale]
}

tip_delay = 5 * room_speed; //Delay to not display a tip (spawning or in new room)
tip_delay_current = tip_delay;
tip_timer = 10; //Default timer in seconds
tip_timer_frames = room_speed; //Timer in frames
tip_timer_current = tip_timer; //Current timer, based off seconds
tip_enabled = true; //Hide the tip, but fade first
alpha = 0; //Default alpha
alpha_change = 0.05; //Amount of alpha to ease in/out
scale = 0.5; //Text size
color_title = c_gray; //Color of sprite titles
color_text = c_white; //Color of normal text
buffer = 10;

//USE '\n' TO LINE BREAK
tip_list = scUICreateMenuPage(
	[tip_element.sprite, sHealth, "Pickups", "Low on health?\nPickup an extra life!", 1],
	[tip_element.sprite, sPlayer_idle, "Ultimates", "Each hero has their own ultimate.\nPick your favorite hero and\nobliterate the competition.", 1],
	[tip_element.sprite, choose(s_abilityIcon_Invisible, s_abilityIcon_Damage, s_abilityIcon_LifeSteal, s_abilityIcon_Cooldown),
		"Buffs", "Gain an advantage over\nothers by grabbing a buff!", 0.5],
	//[tip_element.sprite, s_modifier_fire, "Ultimates", "Each ", 1],
);

tip_current = irandom_range(0, ds_grid_height(tip_list) - 1); //Randomize the first tip

//Position on screen
x = RES_W / 4;
y = RES_H - RES_H / 9; 

//Front of pause menu
depth -= 2;

//Notifications
not_timer = 4 * room_speed; //Default timer in seconds
not_timer_cur = 0; //Timer in frames
not_enabled = false; //Hide the not, but fade first
not_alpha = 0;
not_text_title = "NOTIFICATION";
not_text = ds_list_create();