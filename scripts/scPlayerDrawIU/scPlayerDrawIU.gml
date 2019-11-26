//Draw Player UI

var _hmap = health_map;
var _x = _hmap[? HEALTH_MAP.X];
var _y = _hmap[? HEALTH_MAP.Y];
var _len = _hmap[? HEALTH_MAP.LENGTH]; //Length of bar
var _hei = _hmap[? HEALTH_MAP.HEIGHT]; //Height of bar
var _buffer = 20;

scPlayerDrawUIHealth(_x, _y, _len, _hei, true, 1, true);
scPlayerDrawUIBuffsOLD();
scPlayerDrawUIWeaponOLD(_x + _len + _buffer, _y, 30, 3);
scPlayerDrawUIAbility(_x + _len + (_buffer * 2) + (30 * 2), _y, 50, 1);