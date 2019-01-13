//Evade spawning and giving to player or giving to player after game ended
if (!checked || !global.play) exit;
//Add health to player
var added = false;
with (other)
	if (hp != hp_original) {
		hp += other.hp_amount;
		hp_scale += 2;
		added = true;
	}
if (added)
	event_inherited();