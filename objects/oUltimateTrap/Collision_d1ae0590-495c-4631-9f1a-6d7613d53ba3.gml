/// @desc 

if (standing && trapped == noone && other.id != owner.id) {
	trapped = other;
	trapped_hp = other.hp;
	image_index = 2;
	scBuffAdd(BUFFTYPE.BLEEDOUT, other, owner);
}
