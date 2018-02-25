/// @description Insert description here
// You can write your code in this editor

mp_potential_step(obj_player.x, obj_player.y, 2, true);

var coll = instance_place(x, y, obj_damage);
// -- instance_place checks if there enemy collides with damage object
// -- if there is, returns the instance id of the obj_damage to coll
// -- if there is, returns the contant noone with a value -4 (pseudo-false) to coll
// -- pseudo-false: any number < 0.5
// -- pseudo-true: any number >= 0.5

if(coll && coll != last_coll) {
	show_debug_message("Hit!! " + string(id));
	show_debug_message("This coll: " + string(coll));
	show_debug_message("Last coll: " + string(last_coll));
	hp -= 5;
	last_coll = coll;
	// only deal damage to enemy if it collides with a damage object
	// and if the damage object that collides with the enemy now has a different id
	// than the previous collided object
}
					
if(hp == 0) {
	instance_destroy(id);
}

depth = -y + 16;