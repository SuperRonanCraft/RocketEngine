global.stages = 0;
var val = 0;
global.stages[val] = ds_map_create();
ds_map_add(global.stages[val], "x", 0);
ds_map_add(global.stages[val], "y", 0);
ds_map_add(global.stages[val], "stage", rKnockOutStage1);

val = 1;
global.stages[val] = ds_map_create();
ds_map_add(global.stages[val], "x", RES_W);
ds_map_add(global.stages[val], "y", 0);
ds_map_add(global.stages[val], "stage", rKnockOutStage2);

val = 2;
global.stages[val] = ds_map_create();
ds_map_add(global.stages[val], "x", RES_W * 2);
ds_map_add(global.stages[val], "y", 0);
ds_map_add(global.stages[val], "stage", rKnockOutStage3);