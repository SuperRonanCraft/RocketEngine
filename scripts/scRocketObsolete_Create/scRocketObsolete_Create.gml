obsoleteMap = ds_map_create();

var map = obsoleteMap;
var offset = owner.shoot_face ? owner.facing : (owner.team == TEAM.LEFT ? 1 : -1);
map[? "hsp"] = rocket_map[? ROCKET_MAP.SPEED] + (owner.hsp * offset);
map[? "vsp"] = -7 * sign(owner.image_yscale);
map[? "grv"] = 0.4 * sign(owner.image_yscale);
map[? "flip"] = choose(-1, 1); //-1 is right, 1 is left is right spin
map[? "flip_spd"] = 6; //Flip speed
size *= 3; //Increase explosion size