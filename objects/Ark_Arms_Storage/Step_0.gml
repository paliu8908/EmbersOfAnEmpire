/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

for(var i = 0; i < instance_number(Ark_HQ); i++)
{
	if(instance_find(Ark_HQ, i).faction_number == faction_number)
	{
		Ark_HQ.unitData[10, 4] = true;
	}
}

if(array_length(ammo) < 3)
{
	for(var i = 0; i < array_length(unitData); i++)
	{
		unitData[i, 6] = true
	}
	
}