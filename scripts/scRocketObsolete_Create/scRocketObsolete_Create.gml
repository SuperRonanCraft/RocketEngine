obsolete = ds_map_create();
obsolete[? "flip"] = choose(-1, 1); //-1 is right, 1 is left is right spin
obsolete[? "dir"] = direction == 0 ? 10 : 170; //Actual flying direction
obsolete[? "rot"] = direction;
size *= 3; //Increase explosion size