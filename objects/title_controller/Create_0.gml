/// @description Insert description here
// You can write your code in this editor

fade = false;
alpha = 0;
fade_frames = 50;
snd = audio_play_sound(snd_title, 10, 1);
audio_sound_gain(snd, 0, 0);
audio_sound_gain(snd, 1, 5000);