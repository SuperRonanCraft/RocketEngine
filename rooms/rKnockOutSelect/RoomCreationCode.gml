global.stages = 0;
global.stages[0] = ds_map_create();
ds_map_add(global.stages[0], "x", 0);
ds_map_add(global.stages[0], "y", 0);
ds_map_add(global.stages[0], "stage", rKnockOutStage1);

global.stages[1] = ds_map_create();
ds_map_add(global.stages[1], "x", RES_W);
ds_map_add(global.stages[1], "y", 0);
ds_map_add(global.stages[1], "stage", noone);

global.stages[2] = ds_map_create();
ds_map_add(global.stages[2], "x", 0);
ds_map_add(global.stages[2], "y", RES_H);
ds_map_add(global.stages[2], "stage", noone);

global.stages[3] = ds_map_create();
ds_map_add(global.stages[3], "x", RES_W);
ds_map_add(global.stages[3], "y", RES_H);
ds_map_add(global.stages[3], "stage", noone);