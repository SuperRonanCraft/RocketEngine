obsoleteMap = ds_map_create();

var map = obsoleteMap;
var offset = owner.shoot_face ? owner.facing : (owner.team == TEAM.LEFT ? 1 : -1);
map[? "hsp"] = weapon_map[? WEAPON_MAP.SPEED] + (owner.hsp * offset * 0.5);
map[? "vsp"] = (-7 * sign(owner.image_yscale) ) + (owner.vsp/2);
map[? "grv"] = 0.4 * sign(owner.image_yscale);
map[? "flip"] = choose(-1, 1); //-1 is right, 1 is left is right spin
map[? "flip_spd"] = 6; //Flip speed
var rocket_map = weapon_map[? WEAPON_MAP.MAP];
rocket_map[? ROCKET_MAP.EXPLOSION_SCALE] *= 2.2; //Increase explosion size