  /// @description Insert description here
// You can write your code in this editor

if(ifBoosted)
{
	draw_sprite_ext(shock_effect, supframe/15, x, y, sprite_width/(150), sprite_height/(150), direction, c_orange, 1);
	
	supframe ++;
	
	if(supframe == 45)
	{
		supframe = 0;
	}
	
}

if(if_affected(effects, "Quiver"))
{
	draw_sprite_ext(shock_effect, supframe/15, x, y, sprite_width/(150), sprite_height/(150), direction, c_red, 1);
	
	supframe ++;
	
	if(supframe == 45)
	{
		supframe = 0;
	}
	
}

// Inherit the parent event
event_inherited();

