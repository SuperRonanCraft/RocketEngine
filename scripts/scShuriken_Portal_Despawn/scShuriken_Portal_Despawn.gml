


var xplo = instance_create_depth(x,y,depth,oExplosion_Shuriken);

xplo.parent = owner;
xplo.image_xscale = 1.5;
xplo.image_yscale = 1.5;
ds_map_copy(xplo.weapon_map, weapon_map);
ds_list_copy(xplo.hitList, hitList);

scScreenShake(25,5);
instance_destroy();