/// @desc 

if (standing && trapped == noone && other.id != owner.id) {
	trapped = other;
	trapped_hp = other.hp;
}