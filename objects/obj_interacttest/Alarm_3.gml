/// @description Single flash timer
// You can write your code in this editor

// single flash timer - set length using alarm[3] = x
glow_state = 0;

if(color != global.c_glo_yellow)
{
	emote = 0;
	color = global.c_glo_yellow;
	sprite_index = spr_glo_yellowsafe;
	dialog_open = 0;
	behavior_state = 0;
}