/// @desc Rumble gamemode started

//Inherit the default gamemode setup
event_inherited();

//Remove the ability to take damage
with (oPlayer) {
	damage_take = false; //Set damage take to false
}