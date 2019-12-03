//global.name = get_string("Enter your display name!", "Lame Butt");
//SlideTransition(TRANS_MODE.GOTO, rServer);
//instance_create_depth(x, y, depth, oServer);
instance_create_depth(x, y, depth, oClient);
instance_create_depth(x, y, depth, oUINetworkGame);
instance_destroy();