/// @description Insert description here
// You can write your code in this editor
randomize();

atkChance = floor(random_range(0, activation));

if(!if_atk && atkChance== 1)
{
	if_atk = true;
	
	var sectionHalf = ds_list_size(global.battlegroup1);
	
	for(var e = 0; e < ds_list_size(global.battlegroup1); e++)
	{
		
		var _columns = floor(sqrt(sectionHalf));
		
		var _rows = floor(sectionHalf/_columns);
		
		var unit = ds_list_find_value(global.battlegroup1, e);
		
		//sqrt(global.selection) gives rows, % gives columns.
		var _Xoff = _columns * 0.5 * unit.unitSpread - floor(e%_rows) * unit.unitSpread;
		var _Yoff = _rows * 0.5 * unit.unitSpread - floor(e/_rows) * unit.unitSpread;

		
		ds_list_clear(unit.moveXList);
		ds_list_clear(unit.moveYList);
		
		ds_list_add(unit.moveXList, _Xoff + (room_width/ 2) + e * 75 - sectionHalf * 75);
		ds_list_add(unit.moveYList, _Yoff + _rows * unit.unitSpread + 30);
		
		unit.move_x = ds_list_find_value(unit.moveXList, 0);
		unit.move_y = ds_list_find_value(unit.moveYList, 0);
		
		ds_list_add(unit.moveXList, _Xoff + room_width - 30);
		ds_list_add(unit.moveYList, _Yoff + (room_height/2) + e * 75 - sectionHalf * 75);
		
		ds_list_add(unit.moveXList, _Xoff + (room_width/ 2) + e * 75 - sectionHalf * 75);
		ds_list_add(unit.moveYList, _Yoff + room_height - 30);
		
		ds_list_add(unit.moveXList, _Xoff + _columns * unit.unitSpread + 30);
		ds_list_add(unit.moveYList, _Yoff + (room_height/2) + e * 75 - sectionHalf * 75);
		
		unit.if_move = 1;
		unit.patrol = true;
	}
}