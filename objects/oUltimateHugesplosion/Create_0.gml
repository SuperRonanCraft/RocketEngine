/// @desc Sand Ultimate created!

//Owner of the ultimate
owner = noone;
side = TEAM.LEFT;
first_draw = false;

//Settings
explode_rocket_speed = 10;
explode_rocket_len = RES_W / 3;
explode_scale = 5;
explode_sprite = sexplosion_Default;
explode_rocket_particle = oParticleHandler.ds_part[? PARTICLES.SAND];
explode_rocket_particle_amt = 10;

traveled = 0;
exploding = false;
exploded = false;
damage_list = ds_list_create();
damage = 2;