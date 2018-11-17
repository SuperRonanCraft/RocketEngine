/// @arg Weapon
weapon = argument0;
//All default values
rocket_map = 0;
scRocketsDefaults();
var wp_map = weapons[weapon];
var key = "";
for (var i = 0; i <	ds_map_size(wp_map); i++) {
	if (i == 0)
		key = ds_map_find_first(wp_map);
	else
		key = ds_map_find_next(wp_map, key);
	rocket_map[? key] = wp_map[? key];
	show_debug_message(string(key));
}
ammo = rocket_map[? ROCKET_MAP.CLIP];
/*if (ds_map_exists(wp_map, "recoil"))
	rocket_map[? "recoil"] = wp_map[? "recoil"]; //Amount of recoil to push the player back
if (ds_map_exists(wp_map, "damage"))
	rocket_map[? "damage"] = wp_map[? "damage"]; //Damage count
if (ds_map_exists(wp_map, "projectile"))
	rocket_map[? "projectile"] = wp_map[? "projectile"]; //Sprite to show
if (ds_map_exists(wp_map, "projectile_sound"))
	rocket_map[? "projectile_sound"] = wp_map[? "projectile_sound"]; //Rocket shoot sound (default SOUND.GP_SHOOT)
if (ds_map_exists(wp_map, "cooldown"))
	rocket_map[? "cooldown"] = wp_map[? "cooldown"]; //Cooldown between shots
if (ds_map_exists(wp_map, "bulletspeed"))
	rocket_map[? "bulletspeed"] = wp_map[? "bulletspeed"]; //Speed of rocket
if (ds_map_exists(wp_map, "offset"))
	rocket_map[? "offset"] = wp_map[? "offset"]; //offset to spawn the rocket
if (ds_map_exists(wp_map, "startup"))
	rocket_map[? "startup"] = wp_map[? "startup"]; //Delay between clicking the shoot key and launching
if (ds_map_exists(wp_map, "clip"))
	rocket_map[? "clip"] = wp_map[? "clip"]; //How much 
ammo = clip;
if (ds_map_exists(wp_map, "reload_time"))
	rocket_map[? "reload_time"] = wp_map[? "reload_time"]; //Reload time
if (ds_map_exists(wp_map, "specials"))
	rocket_map[? "specials"] = wp_map[? "specials"]; //special scripts
if (ds_map_exists(wp_map, "timer"))
	rocket_map[? "timer"] = wp_map[? "timer"]; //Up-time
if (ds_map_exists(wp_map, "ignore_wall"))
	rocket_map[? "ignore_wall"] = wp_map[? "ignore_wall"]; //allow wall clipping
if (ds_map_exists(wp_map, "name"))
	rocket_map[? "name"] = wp_map[? "name"]; //name of rocket
if (ds_map_exists(wp_map, "buff"))
	rocket_map[? "buff"] = wp_map[? "buff"]; //buff of rocket
if (ds_map_exists(wp_map, ROCKET_MAP.COLLIDE))
	rocket_map[? ROCKET_MAP.COLLIDE] = wp_map[? ROCKET_MAP.COLLIDE]; //explosion of rocket*/

//Collision checks	
/*if (ds_map_exists(wp_map, "specialCollideRocket"))
	specialCollideRocket = wp_map[? "specialCollideRocket"]; //Define action for rocket collision
	
if (ds_map_exists(wp_map, "specialCollideWall"))
	specialCollideWall = wp_map[? "specialCollideWall"]; //Define action for wall collision
	
if (ds_map_exists(wp_map, "specialCollideShootable"))
	specialCollideShootable = wp_map[? "specialCollideShootable"]; //Define action for shootable collision
*/