var offset = rocket_map[? ROCKET_MAP.OFFSET];
var dir = image_angle;
var xx = x - lengthdir_x(offset, dir), yy = y - lengthdir_y(offset, dir);
part_particles_create(global.ParticleSystem1, xx, yy, oParticleHandler.ds_part[? PARTICLES.SMOKE1], 1);