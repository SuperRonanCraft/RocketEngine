// Lightnin rocket has been summoned (PIKA PIKA)

lightning = ds_map_create();
lightning[? "len"] = 25;
lightning[? "sparks"] = 1;
lightning[? "branches"] = 3;
lightning[? "dis_target"] = RES_W / 1.5;
lightning[? "dis_travelled"] = 0;
lightning[? "dis_slowed"] = lightning[? "dis_target"] / 2;
rocket_map[? ROCKET_MAP.EXPLOSION_SCALE] *= 2; //Increase explosion size