/// @desc 

if(owner != noone){
	if(!instance_exists(owner)){
		instance_destroy();
	}
}
if (standing && trapped == noone && other.id != owner.id) {
	trapped = other;
	trapped_hp = other.shootable_map[? SHOOTABLE_MAP.HEALTH];
	image_index = 2;
	scBuffAdd(BUFFTYPE.BLEEDOUT, other, owner);
}
