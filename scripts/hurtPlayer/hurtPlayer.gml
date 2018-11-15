///@desc Hurt the player for the amount given. Affected by buffs.
///@arg source Source of damage
///@arg target Player to be hurt

var source = argument[0];
var target = argument[1];

target.hp -= source.damage;
target.flash = 3;
target.hitFrom = source.direction;
target.hpscale = 2;
