/// @description  ACTIVATED, RUN ONCE

for (var i = 0; i < instance_number(oDoor); i++) {
    if(instance_find(oDoor,i).section_id == section_id) instance_find(oDoor,i).activated = true;
}

doorSpawns = [];

for (var j = 0; j < instance_number(oDoorSpawn); j++) {
    if(instance_find(oDoorSpawn,j).section_id == section_id) array_push(doorSpawns,instance_find(oDoorSpawn,j));
}

for (var i = 0; i < array_length(enemiesBoss); i++) {
	array_push(toKill, scCreatePlayer(doorSpawns[i].x, doorSpawns[i].y, enemiesBoss[i]));
}


for (var i = 0; i < array_length(enemies); i++) {
	array_push(toKill, scCreateEnemy(doorSpawns[i].x, doorSpawns[i].y, enemies[i]));
}


