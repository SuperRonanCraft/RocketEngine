/// @description  

ds_list_add(hitList, other);

if(other.owner != owner){
	
	var slash = instance_create_depth(other.x,other.y,depth,oUltimateSlashEffect);
	slash.image_blend = c_red;
	scPlaySound(SOUND.EFFECT_REFLECT);
	slash.owner = id;

	owner.hsp_move += (other.image_xscale * 32);
	owner.vsp_move -= 5;

	schwing = true;

}