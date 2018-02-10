/// @description Insert description here
// You can write your code in this editor

if (keyboard_check(vk_left)) {
	sprite_index = spr_playerWalkLeft;
}
else if (keyboard_check(vk_right)) {
	sprite_index = spr_playerWalkRight;
}
else if (keyboard_check(vk_up)) {
	//sprite_index = sprite_playerWalkBack;
}
else if(keyboard_check(vk_down)) {
	//sprite_index = sprite_playerWalkForward;
}
else {
	if (keyboard_check_released(vk_left)) {
		sprite_index = spr_playerStandLeft;
	} 
	else if (keyboard_check_released(vk_right)) {
		sprite_index = spr_playerStandRight;
	}
	else if (keyboard_check_released(vk_up)) {
		//sprite_index = sprite_playerStandBack;
	}
	if (keyboard_check_released(vk_down)) {
		//sprite_index = sprite_playerStandForward;
	}
}

draw_sprite(sprite_index, image_index, x, y);

var shift_down = keyboard_check(vk_shift);
var mouse_down = mouse_check_button(mb_left);

var tile_x = floor(x / 16);
var tile_y = floor(y / 16);
	
if(shift_down) {
	
	var layer_id = layer_get_id("tiles_path");
	var tilemap_id = layer_tilemap_get_id(layer_id);	
	
	var layer_id_terra = layer_get_id("tiles_terraformed");
	var tilemap_id_terra = layer_tilemap_get_id(layer_id_terra);
	
	var y_dist = floor((mouse_y - y) / 16);
	var y_sign = sign(y_dist);
	
	var x_dist = floor((mouse_x - x) / 16);
	var x_sign = sign(x_dist);
		
	x_dist = abs(x_dist);
	y_dist = abs(y_dist);
	
	if(last_valid_y_dist * last_valid_y_sign != y_dist * y_sign || last_valid_x_dist * last_valid_x_sign != x_dist * x_sign) {
		tilemap_clear(tilemap_id, 0);
	}
	
	tilemap_set(tilemap_id, 2, tile_x, tile_y);

	if(floor(mouse_x / 16)  == tile_x){	
		for(var i = 1; i < y_dist + 1; i++) {
			if(tilemap_get(tilemap_id_terra, tile_x, tile_y + i * y_sign) != 0) {
				break;
			}
			if(tilemap_get(tilemap_id, tile_x, tile_y + i * y_sign) == 0) {
				tilemap_set(tilemap_id, 1, tile_x, tile_y + i * y_sign);
			}
		}
		last_valid_y_dist = y_dist;
		last_valid_y_sign = y_sign;
	}
	else if(floor(mouse_y / 16) == tile_y) {
		for(var i = 1; i < x_dist + 1; i++) {
			if(tilemap_get(tilemap_id_terra, tile_x + i * x_sign, tile_y) != 0) {
				break;
			}
			if(tilemap_get(tilemap_id, tile_x + i * x_sign, tile_y) == 0) {
				tilemap_set(tilemap_id, 1, tile_x + i * x_sign, tile_y);
			}
		}
		last_valid_x_dist = x_dist;
		last_valid_x_sign = x_sign;
	}
	
	if(mouse_check_button_pressed(mb_left)) {
		
		var last_tile;
		var adjust;
		
		if(floor(mouse_x / 16)  == tile_x){	
			adjust = (y_sign == 1? 1 : 0);
			for(var i = 1; i < y_dist + 1; i++) {
				last_tile = i;
				if(tilemap_get(tilemap_id_terra, tile_x, tile_y + i * y_sign) == 0) {
					tilemap_set(tilemap_id_terra, 6, tile_x, tile_y + i * y_sign);
				}
				else {
					break;
				}
			}
			var damage_spread = instance_create_layer(tile_x * 16, (tile_y + adjust * y_sign) * 16, "instances_player", obj_damage);
			damage_spread.image_yscale = (last_tile + 1) * y_sign;
		}
		else if(floor(mouse_y / 16) == tile_y) {
			adjust = (x_sign == 1? 1 : 0);
			for(var i = 1; i < x_dist + 1; i++) {
				last_tile = i;
				if(tilemap_get(tilemap_id_terra, tile_x + i * x_sign, tile_y) == 0) {
					tilemap_set(tilemap_id_terra, 6, tile_x + i * x_sign, tile_y);
				}
				else {
					break;
				}
			} 
			var damage_spread = instance_create_layer((tile_x + adjust * x_sign) * 16, tile_y * 16, "instances_player", obj_damage);
			damage_spread.image_xscale = (last_tile + 1) * x_sign;
		}
	}
}

if(keyboard_check_released(vk_shift)) {
	var layer_id = layer_get_id("tiles_path");
	var tilemap_id = layer_tilemap_get_id(layer_id);
	tilemap_clear(tilemap_id, 0);
}