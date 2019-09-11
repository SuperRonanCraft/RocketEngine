//Damage combos (multipliers)
combo_amount = 0; //If were in a combo
combo_player = noone;
combo_text = ["GREAT!", "WONDERFUL", "AMAZING!", "KILLING SPREE!"];
combo_text_current = combo_text[0];
combo_scale = 1; //Scale of combo
//combo_cooldown = 50; //Cool down on the combo is step amount
//combo_cooldown_current = 0; //Internal timer

enum COMBO {
	ENTITY, TEXTS = ["GREAT!", "WONDERFUL", "AMAZING!", "KILLING SPREE!"]
}