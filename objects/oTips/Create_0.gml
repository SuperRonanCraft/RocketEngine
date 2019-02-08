/// @desc Tips object has been spawned

enum tip_element {
	sprite, //Display a sprite, title and desc
	sprite_buff, //Displa a buff sprite, title and desc
	text //Just text
}

tip_delay = 5 * room_speed; //Delay to not display a tip (spawning or in  new room)
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

tip_list = scUICreateMenuPage(
	[tip_element.sprite, sRocket_Homing, "HOMING ROCKET", "A menacing soft-lock rocket!"],
	[tip_element.sprite, sHealth, "HEALTH PICKUPS", "Low on health?\nPickup an extra life!"],
	[tip_element.text, "Remember to use your left and right\nkeys to cast ultimates!"],
	[tip_element.sprite_buff, choose(s_abilityIcon_BurnRush, s_abilityIcon_ReverseControls, s_abilityIcon_Chilled, s_abilityIcon_Cooldown),
		"Buffs", "Gain an advantage over\nothers by grabbing a buff!"],
	[tip_element.text, "Each rocket has its own ultimate!"],
	[tip_element.sprite, sUltTrap, "Trap", "Grab a spiked rocket and trap\nyour enemy for inevitable damage!"]
);

tip_current = irandom_range(0, ds_grid_height(tip_list) - 1); //Randomize the first tip

//Position on screen
x = RES_W / 4;
y = RES_H - RES_H / 8; 

//Front of pause menu
depth -= 2;