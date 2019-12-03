//Draw Player UI

var _hmap = health_map;
var _x = _hmap[? HEALTH_MAP.X];
var _y = _hmap[? HEALTH_MAP.Y];
var _len = _hmap[? HEALTH_MAP.LENGTH]; //Length of bar
var _hei = _hmap[? HEALTH_MAP.HEIGHT]; //Height of health bar
var _alpha = local_player ? _hmap[? HEALTH_MAP.ALPHA] : _hmap[? HEALTH_MAP.ALPHA] / 2;
var _buffer_y = 20;
var _buffer_x = 28;
var _buffer_ab = 4;

scPlayerDrawUIHealth(_x, _y, _len, _hei, true, _alpha, true);
scPlayerDrawUIWeapon(_x + _len + _buffer_x, _y, _buffer_ab, _alpha);
scPlayerDrawUIAbility(_x + _len + (_buffer_x * 3) + (_buffer_ab * 4), _y, 32, _buffer_ab, _alpha);
scPlayerDrawUIUltimate(_x, _y + _hei + _buffer_y, _len, _alpha);
scPlayerDrawUIBuffs(_x, _y + _hei * 2 + _buffer_y * 2, 10, 10, 32, _alpha);