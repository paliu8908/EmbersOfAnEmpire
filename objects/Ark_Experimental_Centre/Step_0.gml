/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

for(var i = 0; i < array_length(unitData); i++)
{
	var combatDat = 12 + floor(i div 3);
	
	//iron reduced by 1 for every 5 combat data.
	unitData[i][2] = baseData[i][2] - round(global.combatData[0][combatDat]) div 5;
	
	//time reduced by 1 for every 25 combat data
	unitData[i][1] = baseData[i][1] - round(global.combatData[0][combatDat] div 25);
	
	//energy reduced by 1 for every 50 combat data
	unitData[i][3] = baseData[i][3] - round(global.combatData[0][combatDat] div 50);
	
}

