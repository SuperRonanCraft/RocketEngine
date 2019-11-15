/// @description  Clean up maps

event_inherited();

ds_list_destroy(hitList);
ds_list_destroy(confirmList);
ds_list_destroy(touching);
