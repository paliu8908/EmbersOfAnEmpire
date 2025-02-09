// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Add_Skill_Options(uni){
	array_push(uni.abilities, 
			[0, "LevelUp", 0, 0, false, true, icon_Prox_AtkSkill, true, 1, 1],
			[1, "LevelUp", 0, 0, false, true, icon_Prox_DefSkill, true, 1, 1],
			[2, "LevelUp", 0, 0, false, true, icon_Prox_AbilitySkill, true, 1, 1]

	)


		//		upgrade	type	reload	counter	deploys recharged sprite unlocked cost	gain
		//			0	  1			2		3	   4	5			6	   7		8      9
}