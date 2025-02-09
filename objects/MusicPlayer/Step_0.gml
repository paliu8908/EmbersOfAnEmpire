/// @description Insert description here
// You can write your code in this editor

if(!audio_is_playing(currentTheme))
{
	themeNum++;
	
	if(themeNum == ds_list_size(audios))
	{
		themeNum = 0;
	}
	
	currentTheme = ds_list_find_value(audios, themeNum);
	
	audio_play_sound(currentTheme, 1, false);
	

}

