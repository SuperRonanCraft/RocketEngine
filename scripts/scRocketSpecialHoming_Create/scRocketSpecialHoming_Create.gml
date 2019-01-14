target = noone;

//Find a target
for (var i = 0; i < instance_number(pShootable); i += 1)
		if (instance_find(pShootable, i) != owner)
			target = instance_find(pShootable, i);