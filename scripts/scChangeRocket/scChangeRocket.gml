/// @arg Weapon
weapon = argument0;
var wp_map = weapons[weapon];
recoil = wp_map[? "recoil"]; //Amount of recoil to push the player back
damage = wp_map[? "damage"]; //Damage count
projectile = wp_map[? "projectile"]; //Sprite to show
cooldown = wp_map[? "cooldown"]; //Cooldown between shots
bulletspeed = wp_map[? "bulletspeed"]; //Speed of rocket
offset = wp_map[? "offset"]; //offset to spawn the rocket
startup = wp_map[? "startup"]; //Delay between clicking the shoot key and launching
clip = wp_map[? "clip"]; //How much 
ammo = clip;
reload_time = wp_map[? "reload_time"];
specials = wp_map[? "specials"];
timer = wp_map[? "timer"];