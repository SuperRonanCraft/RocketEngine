if (!exit_created) {
	if (timer <= 0) {
		exit_created = true;
		exit_x = owner.x;
		exit_y = owner.y;
	} else {
		timer--;
	}
	image_alpha = min(image_alpha + alpha_change, max_alpha);
} else if (portal_timer > 0) {
	//Both portals must be fully visible before being used
	if (portal_alpha != max_alpha || image_alpha != max_alpha) {
		portal_alpha = min(portal_alpha + alpha_change, max_alpha);
		image_alpha = min(image_alpha + alpha_change, max_alpha);
		exit;
	}
	
	portal_timer--;
	//Collision
	event_user(0);
	
} else {
	portal_alpha = max(portal_alpha - alpha_change, 0);
	image_alpha = max(image_alpha - alpha_change, 0);
	if (portal_alpha == 0 && image_alpha == 0)
		instance_destroy();
}