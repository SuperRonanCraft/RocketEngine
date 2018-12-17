/// @desc Update keybinds

if (!keys_update) exit;

//Go through each current player
with (oPlayer) //Update the keybinds live if a player exists
	scKeybindsSet(keys);