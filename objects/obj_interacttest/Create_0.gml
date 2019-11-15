/// @description Insert description here
// You can write your code in this editor
randomize();
dialogue = 0;
hp = 3;
hits = hp;
cd = 30;
player_damage_cd = 0;
mood = random_range(1, 1000);
flash_cycle = 0; // used to toggle whether glodent is flashing
glow_state = 0; // 1 if the glowing sprite is showed
color = c_yellow;
emote = glodentEmote.none;

/*
facing = 1;
*/
/*
alarm[0] = 80;
*/
last_coll = -1;
coll_state = 0;

behavior_state = 0;
// states:
// 0: idle;
// 1: alarmed;
// 2: escaping;
// 3: interacting with player;
// 4: interacting with glodent;
observe_radius = 220;
alarm_radius = 150;
escape_radius = 80;
interact_radius = 30;
escape_cooldown = 0;
interact_probability = 0.2; //probability that a glodent will be able to interact in any given cycle
interact_potential = 1; // 1 if glodent is able to enter interact state (randomly generated)
dialog_open = 0;
interact_target = 0; //id of object being interacted with
player_trust_flag = 0; // 1 if player has flashed yellow and glodent trusts them


// add light object
glow_inst = glodentGlow_create(glodentColor.none);


//path_start(path_enemy4, 1.2, path_action_continue, true);
path = path_add();

startx = x;
starty = y;
nextdir = 128;
forage_timer = 5;

pos = 1;
if(mp_grid_path(global.robotGrid, path, x, y, x + nextdir, y, false)) {
	path_set_kind(path, 0);
	xx = path_get_point_x(path, pos);
	yy = path_get_point_y(path, pos);
	nextdir *= -1;
}
else {
	xx = -1;
	yy = -1;
}


in_cutscene = false;
use_default = false;
spr_walk = spr_ratalarmed;
spr_idle = spr_ratcalm;