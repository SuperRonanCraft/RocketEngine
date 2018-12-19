/// @desc Changes to the next stage selection
/// @arg index direction to switch to

stage_on += argument0;
if (stage_on >= stages)
	stage_on = 0;
else if (stage_on < 0)
	stage_on = stages - 1;