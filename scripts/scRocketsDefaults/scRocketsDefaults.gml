recoil = 0; //Amount of recoil to push the player back
damage = 1; //Damage count
projectile = -1; //Sprite to show
projectile_sound = SOUND.GP_SHOOT; //Rocket shoot sound
cooldown = 0; //Cooldown between shots
bulletspeed = 0; //Speed of rocket
offset = 10; //offset to spawn the rocket
startup = 0; //Delay between clicking the shoot key and launching
clip = -1; //How much 
ammo = clip;
reload_time = -1; //Reload time
specials = noone; //Special scripts
timer = -1; //Up-time
ignore_wall = false; //allow wall clipping
name = "default";

//Special Collision Checks
//Determine what a rocket does when it collides with either object
//If kept at noone, does default action
specialCollideWall = noone;
specialCollideRocket = noone;
specialCollideShootable = noone;