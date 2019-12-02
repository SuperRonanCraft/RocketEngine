//global.name = get_string("Enter your display name!", "Lame Butt");
instance_create_depth(x, y, depth, oServer);
instance_create_depth(x, y, depth, oClient);
instance_create_depth(x, y, depth, oUINetworkGame);
instance_destroy();
//SlideTransition(TRANS_MODE.GOTO, rServer);