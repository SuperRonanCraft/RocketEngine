//DRAW PLAYER HEALTH
/*var _hmap = health_map;
var _len = _hmap[? HEALTH_MAP.LENGTH]; //Length of bar
var _hei = _hmap[? HEALTH_MAP.HEIGHT]; //Height of bar
var _offset = 0;
if (shootable_map[? SHOOTABLE_MAP.HEALTH] <= 2)
	_offset = scMovementWave(-3, 3, 1);
var _side = team == TEAM.LEFT ? 1 : -1;
var _x = _side == 1 ? _hmap[? HEALTH_MAP.X] : RES_W - _hmap[? HEALTH_MAP.X];
var _y = _hmap[? HEALTH_MAP.Y];
var _mul = shootable_map[? SHOOTABLE_MAP.HEALTH] / shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL];
var _x2 = _x + ((_len * _mul) * _side);
scDrawSpriteExt(_x, _y, sUIHealthFrame, 0); //FRAME
draw_sprite_part(sUIHealth, 0, 0, 0, ); //HEALTH
	//scDrawRect(_x, _y, _x2, _y + _hei, c_green, false, 1); //Health
if (_hmap[? HEALTH_MAP.DAMAGE] > 0) { //Damaged
	var _per = _hmap[? HEALTH_MAP.DAMAGE] / shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL];
	draw_sprite_part(sUIHealth)
	scDrawRect(_x2, _y, _x2 + (_len * _per) * _side, _y + _hei, c_red, false, 1);
	_hmap[? HEALTH_MAP.DAMAGE] = lerp(_hmap[? HEALTH_MAP.DAMAGE], -0.05, _hmap[? HEALTH_MAP.DAMAGE_MUL]);
} else
	_hmap[? HEALTH_MAP.DAMAGE] = 0;

if (_hmap[? HEALTH_MAP.HEAL] > 0) { //Healed
	var _per = _hmap[? HEALTH_MAP.HEAL] / shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL]; 
	scDrawRect(_x2, _y, _x2 + (_len * _per) * -_side, _y + _hei, c_yellow, false, 1);
	_hmap[? HEALTH_MAP.HEAL] = lerp(_hmap[? HEALTH_MAP.HEAL], -0.05, 0.05);
} else
	_hmap[? HEALTH_MAP.HEAL] = 0;

//FRAME
scDrawRect(_x, _hmap[? HEALTH_MAP.Y], _x + _len * _side, _hmap[? HEALTH_MAP.Y] + _hei, c_black, true, 1);
//TEXT
scDrawText(_x + (_len / 2) * _side, _y + _hei / 2, string(shootable_map[? SHOOTABLE_MAP.HEALTH]) + "/" + string(shootable_map[? SHOOTABLE_MAP.HEALTH_ORIGINAL]), noone, 0.3)

//_hmap[? HEALTH_MAP.FLASH_ALPHA] = max(_hmap[? HEALTH_MAP.FLASH_ALPHA] - _hmap[? HEALTH_MAP.FLASH_ALPHA_REDUCE], 0);