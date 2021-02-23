function scRocketSpecialLaser_Create() {
	var target = noone;
	for (var i = 0; i < instance_number(oPlayer); i += 1)
		if (instance_find(oPlayer, i).team != owner.team)
			target = instance_find(oPlayer, i);
	if (target == noone) exit;
	direction = point_direction(x, y, target.x, target.y);
	image_angle = direction;


}
