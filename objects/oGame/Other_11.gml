/// @desc Unpause
SlideTransition(TRANS_MODE.UNPAUSE);
sprite_delete(background);
background = noone;
instance_destroy(pause_obj);
instance_activate_all();
global.pause = false;