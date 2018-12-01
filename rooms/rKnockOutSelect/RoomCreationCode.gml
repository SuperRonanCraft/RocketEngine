global.stages = 0;
var val = 0
global.stages[val] = ds_map_create();
ds_map_add(global.stages[val], "x", 0);
ds_map_add(global.stages[val], "y", 0);
ds_map_add(global.stages[val], "stage", rKnockOutStage1);