/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

for(var i = 0; i < array_length(unitData); i++)
{
	var combatDat = floor(i div 3);
	
	var row = global.combatData[0];
	
	var iron = baseData[i][2];
	var time = baseData[i][1];
	var energy = baseData[i][3];
	
	//iron reduced by 1 for every 5 combat data.
	unitData[i][2] = iron - round(row[combatDat] div 5) ;
	
	//time reduced by 1 for every 25 combat data
	unitData[i][1] = time - round(row[combatDat] div 25);
	
	//energy reduced by 1 for every 50 combat data
	unitData[i][3] = energy - round(row[combatDat] div 50);
	
}

