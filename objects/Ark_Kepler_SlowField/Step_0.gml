/// @description Insert description here
// You can write your code in this editor

if(speed < maxSpeed)
{
	speed = power(speed, 1.03);
	
	/*if(speed < 15)
	{
		turnAmount += 5 div 30;
	}*/
}

if(timeAlive >= existingTime div 4)
{
	turnAmount = 360;
}
else if(turnAmount < 360)
{
	turnAmount += 5 div 30;
}
 
// Inherit the parent event
event_inherited();

