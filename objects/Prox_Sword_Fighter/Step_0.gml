/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

if(zooming)
{
	zoomCounter++;
	
	if(zoomCounter == speedDuration)
	{
		zooming = false;
		
		zoomCounter = 0;
		
		move_speed = standMoveSpeed;
		
		if(speed > move_speed)
		{
			speed = move_speed;
		}
		
		selectSprite = SwordFighter_Dash;
	
		sprite = SwordFighter;
		
	}
}

if(recharged)
{
	abilityReload++;
	
	if(abilityReload = rechargeTime)
	{
		recharged = true;
		
		abilityReload = 0;
	}
}