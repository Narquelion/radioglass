/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x, y, obj_player) && keyboard_check_pressed(ord("F")))
{
	if(dialogue == 0)
	{
		dialogue = instance_create_layer(0, 0, "instances_text", obj_textbox);	
		with(dialogue)
		{
			text = "A scavenger that flies with membranous wings on its hind legs";
		}
	}
	else
	{	
		if(keyboard_check_pressed(ord("F")))
		{
			instance_destroy(obj_textbox);
			dialogue = 0;
		}
	}
}