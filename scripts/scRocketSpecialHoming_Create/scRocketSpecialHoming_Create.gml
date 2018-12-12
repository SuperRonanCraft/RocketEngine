target = noone;

//Find a target
for (var i = 0; i < instance_number(oPlayer); i += 1)
		if (instance_find(oPlayer, i) != owner)
			target = instance_find(oPlayer, i);