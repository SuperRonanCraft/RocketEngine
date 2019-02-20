teleportMap = ds_map_create();
var target = scFindTarget(owner.team);
var map = teleportMap;
map[? "target"] = target;

if (target != noone)
	map[? "target_y"] = target.y;
else
	map[? "target_y"] = irandom_range(50, RES_H - 50);
map[? "target_dis"] = 200 * (direction > 90 && direction < 270 ? -1 : 1); //distance to travel to teleport
map[? "teleport_time"] = 10 / TIME_SPEED;
map[? "teleporting"] = false;
map[? "teleported"] = false;
map[? "portal_sprite"] = sRocTeleportPortal1;
map[? "portal_img_amt"] = sprite_get_number(map[? "portal_sprite"]) - 1;
map[? "portal_speed"] = sprite_get_speed(map[? "portal_sprite"]);
map[? "portal_img"] = 0;