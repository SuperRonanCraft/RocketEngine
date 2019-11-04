//No need to send us downward if we are going to stay still
//Note: Not how physics works in real life

var map = gravity_map;

if (!map[? GRAVITY_MAP.STANDING])
	map[? GRAVITY_MAP.VSP_MOVE] = clamp(map[? GRAVITY_MAP.VSP_MOVE] + ((map[? GRAVITY_MAP.GRAVITY] * time_dialation) * grv_dir), -32, 32);
//map[? GRAVITY_MAP.HSP_MOVE] = clamp(map[? GRAVITY_MAP.HSP_MOVE], -32, 32);

scGravityCollision();

x += map[? GRAVITY_MAP.HSP];
y += map[? GRAVITY_MAP.VSP];

time_dialation = 1;