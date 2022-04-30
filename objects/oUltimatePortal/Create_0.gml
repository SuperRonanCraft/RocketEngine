owner = noone;
first_step = false;
exit_x = 0;
exit_y = 0;
exit_created = false;
teleported = ds_list_create();
timer_org = 1 * room_speed; //placement time
timer = timer_org;
portal_timer_org = 3 * room_speed; //portal uptime
portal_timer = portal_timer_org; //portal uptime
portal_alpha = 0;
portal_used_entry = false;
portal_used_exit = false;

//connect
portal_connect_spr = s_pteleport; 
portal_connect_img = 0; //Delay between particles
portal_connect_img_max = sprite_get_number(portal_connect_spr);
portal_connect_img_spd = sprite_get_speed(portal_connect_spr);

//OTHER
marginx = sprite_width / 4;
marginy = sprite_height / 4;
image_alpha = 0;
image_yscale = 0;
image_xscale = 0;
portal_yscale = image_yscale;
portal_xscale = image_xscale;
max_alpha = 0.9;
alpha_change = 0.02;

if (instance_number(object_index) > 1) {
	var all_up = true;
	with (object_index)
		if (portal_timer <= 0)
			all_up = false;
	if (all_up)
		scAchievements_CustomEvent(ACHIEVEMENTS.PORTALS, instance_number(object_index));
}