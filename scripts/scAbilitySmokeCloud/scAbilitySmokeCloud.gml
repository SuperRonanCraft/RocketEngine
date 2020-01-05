///@arg ability map

for (var i = 0; i < 10; i++) {
	for (var t = 0; t < 5; t++) {
	    // Make several clouds a tick
		var smokeCloud = instance_create_depth(irandom_range(bbox_left,bbox_right),irandom_range(bbox_top,bbox_bottom),depth+20,oDustCloud);
		smokeCloud.hsp = irandom_range(-i/2,i/2);
		smokeCloud.vsp = irandom_range(-i/2,i/2);
		smokeCloud.timer = irandom_range(180,245);
		smokeCloud.maxtimer = smokeCloud.timer;
		smokeCloud.owner = id;
		smokeCloud.image_speed = random_range(0.5,1);
		//smokeCloud.image_xscale = irandom_range(1,3);
		//smokeCloud.image_yscale = smokeCloud.image_xscale;
	}

}