//Draw Player UI

var _hmap = health_map;
var _x = _hmap[? HEALTH_MAP.X];
var _y = _hmap[? HEALTH_MAP.Y];
var _len = _hmap[? HEALTH_MAP.LENGTH]; //Length of bar
var _hei = _hmap[? HEALTH_MAP.HEIGHT]; //Height of bar

scPlayerDrawUIHealth(_x, _y, _len, _hei, true, 1, true);
scPlayerDrawUIBuffsOLD();
scPlayerDrawUIWeaponOLD();