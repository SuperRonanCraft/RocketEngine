/// @description  

ds_list_add(hitList, other);

if(other.owner != owner){
	var slash = instance_create_depth(other.x,other.y,depth,oUltimateSlashEffect);
	scPlaySound(SOUND.EFFECT_REFLECT);
	slash.owner = id;
	slash.image_blend = c_dkgray;
	owner.hsp_move += (other.owner.facing * 20);

	schwing = true;
	
}
