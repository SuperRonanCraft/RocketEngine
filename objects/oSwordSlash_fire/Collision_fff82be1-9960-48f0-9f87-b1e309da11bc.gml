/// @description  

ds_list_add(hitList, other);

var slash = instance_create_depth(other.x,other.y,depth,oUltimateSlashEffect);
slash.image_blend = c_red;
scPlaySound(SOUND.EFFECT_REFLECT);
slash.owner = id;

owner.hsp_move += (other.owner.facing * 20);
owner.vsp_move -= 5;

schwing = true;
