/*var _hmap = health_map;
if (_hmap[? HEALTH_MAP.DAMAGE_TIME] <= room_speed * 8) {
	_hmap[? HEALTH_MAP.ALPHA] = min(_hmap[? HEALTH_MAP.ALPHA] + 4 / room_speed, 1);
} else
	_hmap[? HEALTH_MAP.ALPHA] = max(_hmap[? HEALTH_MAP.ALPHA] - 2 / room_speed, 0);
if (_hmap[? HEALTH_MAP.ALPHA] <= 0)
	exit;
else
	_hmap[? HEALTH_MAP.DAMAGE_TIME]++;
var _alpha = _hmap[? HEALTH_MAP.ALPHA];
var _len = _hmap[? HEALTH_MAP.LENGTH] / 2; //Length of bar
var _hei = _hmap[? HEALTH_MAP.HEIGHT] / 4; //Height of bar

var _x = x - (_len / 2);
var _y = bbox_top - 20;

var _list = ds_list_create();
collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, object_index, false, false, _list, false);
for (var i = 0; i < ds_list_size(_list); i++) {
	if (_list[| i] == id)
		break;
	else
		_y -= _hei * 2;
	if (i > 10) {
		_y = bbox_top - 20;
		break;
	}
}
ds_list_destroy(_list);

var _mul = shootable_map[? SHOOTABLE_MAP.HEALTH] / shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL];
var _x2 = _x + ((_len * _mul));
scDrawRect(_x, _y, _x2, _y + _hei, c_green, false, _alpha);
if (_hmap[? HEALTH_MAP.DAMAGE] > 0) {
	var _per = _hmap[? HEALTH_MAP.DAMAGE] / shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL];
	scDrawRect(_x2, _y, _x2 + (_len * _per), _y + _hei, c_red, false, _alpha);
	_hmap[? HEALTH_MAP.DAMAGE] = lerp(_hmap[? HEALTH_MAP.DAMAGE], -0.05, _hmap[? HEALTH_MAP.DAMAGE_MUL]);
} else
	_hmap[? HEALTH_MAP.DAMAGE] = 0;

if (_hmap[? HEALTH_MAP.HEAL] > 0) {
	var _per = _hmap[? HEALTH_MAP.HEAL] / shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL];
	scDrawRect(_x2, _y, _x2 - (_len * _per), _y + _hei, c_yellow, false, _alpha);
	_hmap[? HEALTH_MAP.HEAL] = lerp(_hmap[? HEALTH_MAP.HEAL], -0.05, 0.05);
} else
	_hmap[? HEALTH_MAP.HEAL] = 0;

//FRAME
scDrawRect(_x, _y, _x + _len, _y + _hei, c_black, true, _alpha);
//TEXT
//scDrawText(_x + (_len / 2) * _side, _y + _hei / 2, string(shootable_map[? SHOOTABLE_MAP.HEALTH]) + "/" + string(shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL]), noone, 0.3)
