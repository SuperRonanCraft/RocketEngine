/// @desc 
interaction_map = scInteractionsLoad();
ui_boxes = ds_list_create();
ui_alpha_reduce = 0.05;
/*
ui_boxes types
"msg": message to display
"to": person interacting with
"from": person interacting
"obj": object we are displaying this on
"timer": time we should stay up
*/