///@description cutscene_move_character
///@arg obj 
///@arg x
///@arg y
///@arg relative? 
///@arg spd 

var obj = argument0,relative =argument3, spd = argument4;

if(x_dest == -1){
	if (relative){
		x_dest = obj.x + argument1;
		y_dest = obj.y + argument2;
		show_debug_message(x_dest);
				show_debug_message(y_dest);
} else {
		x_dest = argument1;
		y_dest = argument2;		
	}
}


var xx = x_dest;
var yy = y_dest;

with(obj){
	
	if (use_default) sprite_index = spr_walk;
	if(point_distance(x,y,xx,yy) >= spd){
		var dir = point_direction(x,y,xx,yy);
		var ldirx = lengthdir_x(spd, dir);
		var ldiry = lengthdir_y(spd, dir);
		if(ldirx != 0 ) { image_xscale = sign(ldirx) * abs(image_xscale);}
		x += ldirx;
		y += ldiry;
	} else { 
		if (use_default)  sprite_index = spr_idle;
		x = xx;
		y = yy;
		with(other){
			x_dest = -1;
			y_dest = -1;
			cutscene_end_action();		
		}
	}
}

