/// @desc 

// Inherit the parent event
event_inherited();


var _p1 = instance_nearest(0, 0, oPlayer);
var _p2 = instance_furthest(0, 0, oPlayer);

if(_p1 == noone || _p2 == noone)
	exit;

var _xdif = (_p2.x - _p1.x);
var _ydif = (_p2.y - _p1.y);

xTo = _p1.x + (_xdif / 2);
yTo = _p1.y + (_ydif / 2);

var _buff = 128*5; //buffer between players and border
if (_xdif > RES_W - _buff || _ydif > RES_H - _buff) {
	var _ydifres = 0;
	var _xdifres = 0;
	//X's
	if (_xdif > RES_W - _buff) {
		if (_xdif + _buff > room_width)
			cam_size_x = lerp(cam_size_x, room_width, 0.1);
		else
			cam_size_x = lerp(cam_size_x, _xdif + _buff, 0.1);
		_xdifres = _xdif - RES_W + _buff;
	}
	//Y's
	if (_ydif > RES_H - _buff) {
		if (_ydif + _buff > room_height)
			cam_size_y = lerp(cam_size_y, room_height, 0.1);
		else
			cam_size_y = lerp(cam_size_y, _ydif + _buff, 0.1);
		_ydifres = _ydif - RES_H + _buff;
	}
	
	//Ratio and/or room size safety
	var ratio = RES_W / RES_H;
	if (_xdifres > 0 || _ydifres > 0)
		if (_xdifres > _ydifres) //Dif in X greater than Y
			cam_size_y = cam_size_x / ratio;
			if (cam_size_y > room_height) {
				cam_size_y = room_height;
				cam_size_x = cam_size_y * ratio;
			}
		else if (_ydifres > _xdifres) { //Dif in Y greater than X
			cam_size_x = cam_size_y * ratio;
			if (cam_size_x > room_width) {
				cam_size_x = room_width;
				cam_size_y = cam_size_x / ratio;
			}
	}
} else {
	cam_size_x = lerp(cam_size_x, RES_W, 0.1);
	cam_size_y = lerp(cam_size_y, RES_H, 0.1);
}

//Camera set safety
if (cam_size_x != cam_size_x_last || cam_size_y != cam_size_y_last) {
	camera_set_view_size(cam, cam_size_x, cam_size_y);
	view_w_half = cam_size_x / 2;
	view_h_half = cam_size_y / 2;
	cam_size_x_last = cam_size_x;
	cam_size_y_last = cam_size_y;
}