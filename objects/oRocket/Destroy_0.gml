/// @desc Clean up list and remove owners rocket amount
owner.rockets--;
ds_list_destroy(hitList);
ds_list_destroy(confirmList);
ds_map_destroy(rocket_map);