// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ShowButtons(unitID){
	global.unitInfo = unitID.blurb;
	
	for(var run_times = 0; run_times < ds_list_size(unitID.buttons); run_times++)
	{
		var actor = ds_list_find_value(unitID.buttons, run_times);
				
		actor.slot = ds_list_find_index(unitID.buttons, actor);
		

		// This means that abilities MUST come after the first four slots
		if(run_times >= 4 && array_length(unitID.abilities) > 0)
		{
			actor.sprite = unitID.abilities[run_times - 4][6];
			actor.show = 1;
		}
		
		else if(unitID.type == "structure" && unitID.canResearch)
		{
			actor.sprite = unitID.unitData [run_times][5];
			actor.show = 1;
		}
		
		else if(unitID.type == "structure" && unitID.canProduce && unitID.name != "Headquarters")
		{
			actor.topsprite = unitID.unitData[run_times][5];
			actor.show = 2;
		}
		
		actor.visible = true;
			
		actor.depth = UI_Back.depth - 100;
	}
}