///grassCheck(x0,y0):

var x0 = argument0;
var y0 = argument1;
var pixx = x0 * 4;
var pixy = y0 * 4;

var layer_id_terra = layer_get_id("small_tiles_terraformed");
var tilemap_id_terra = layer_tilemap_get_id(layer_id_terra);

						var no_grass_above = ((position_meeting(pixx, pixy-1, obj_barrier) || tilemap_get(tilemap_id_terra, x0, y0 - 1) == 0 || (tilemap_get(tilemap_id_terra, x0, y0 - 1) >= 20 && tilemap_get(tilemap_id_terra, x0, y0 - 1) < 40) || tilemap_get(tilemap_id_terra, x0, y0 - 1) >= 60)? 1 : 0);
						var no_grass_below = ((position_meeting(pixx, pixy+4, obj_barrier) || tilemap_get(tilemap_id_terra, x0, y0 + 1) == 0 || (tilemap_get(tilemap_id_terra, x0, y0 + 1) >= 20 && tilemap_get(tilemap_id_terra, x0, y0 + 1) < 40) || tilemap_get(tilemap_id_terra, x0, y0 + 1) >= 60)? 2 : 0);
						var no_grass_left = ((position_meeting(pixx-1, pixy, obj_barrier) || tilemap_get(tilemap_id_terra, x0 - 1, y0) == 0 || (tilemap_get(tilemap_id_terra, x0 - 1, y0) >= 20 && tilemap_get(tilemap_id_terra, x0 - 1, y0) < 40) || tilemap_get(tilemap_id_terra, x0 - 1, y0) >= 60)? 4 : 0);
						var no_grass_right= ((position_meeting(pixx+4, pixy, obj_barrier) || tilemap_get(tilemap_id_terra, x0 + 1, y0) == 0 || (tilemap_get(tilemap_id_terra, x0 + 1, y0) >= 20 && tilemap_get(tilemap_id_terra, x0 + 1, y0) < 40) || tilemap_get(tilemap_id_terra, x0 + 1, y0) >= 60)? 8 : 0);

						var new_tile = no_grass_above | no_grass_below | no_grass_right | no_grass_left;
						
						return new_tile;