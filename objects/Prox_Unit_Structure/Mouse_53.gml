/// @description Insert description here
// You can write your code in this editor
if(canProduce || canResearch)
{

	for(var _i = 0; _i < array_length(unitData); _i++)
	{
		if(collision_circle(mouse_x, mouse_y, 20, unitData[_i][7], false, false))
		{
			AddToProduction(self, _i);
		}
	}
}



