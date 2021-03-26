/// @description  

ds_list_add(hitList, other);

if(!instance_exists(owner))
	exit;

if(other.owner != owner){
	var slash = instance_create_depth(other.x,other.y,depth,oUltimateSlashEffect);
	scPlaySound(SOUND.EFFECT_REFLECT);
	slash.owner = id;

	schwing = true;

}
