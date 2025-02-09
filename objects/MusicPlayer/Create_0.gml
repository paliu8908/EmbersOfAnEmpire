/// @description Insert description here
// You can write your code in this editor


audios = ds_list_create();

ds_list_add(audios, UnionTheme1, UnionTheme2, UnionTheme3, UnionTheme4);

randomize();

themeNum = irandom_range(0, ds_list_size(audios) - 1);

currentTheme = ds_list_find_value(audios, themeNum);
	
audio_play_sound(currentTheme, 1, false);