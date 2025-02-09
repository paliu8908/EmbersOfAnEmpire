/// @description Insert description here
// You can write your code in this editor
window_set_fullscreen(true);

window_set_cursor(cr_none);

global.ifmbdown = 0;

global.mx = 0;

global.my = 0;

global.releasex = 0;

global.releasey = 0;

global.show_unit_ui = false

keyDown = [false, false, false, false, false, false, false, false];

time_down = 0;

mx = 0;

my = 0;

rx = 0;

ry = 0;

time_held = 0;

depth = -100

//Create a grid
var cell_width = 32

var cell_height = 32

var w_cells = room_width/cell_width

var h_cells = room_height/cell_height

global.pathing_grid = mp_grid_create(0, 0, w_cells, h_cells, cell_width, cell_height)

//mp_grid_add_instances(global.pathing_grid, com_obstacle, false)

collide_enemy = false;

press_unit = false;

global.selection = ds_list_create();

ds_list_clear(global.selection);

global.squad1 = ds_list_create();

ds_list_clear(global.squad1);

global.squad2 = ds_list_create();

ds_list_clear(global.squad2);

global.squad3 = ds_list_create();

ds_list_clear(global.squad3);

global.squad4 = ds_list_create();

ds_list_clear(global.squad4);

global.squad5 = ds_list_create();

ds_list_clear(global.squad5);

global.squad6 = ds_list_create();

ds_list_clear(global.squad6);

global.squad7 = ds_list_create();

ds_list_clear(global.squad7);

global.squad8 = ds_list_create();

ds_list_clear(global.squad8);

global.squad9 = ds_list_create();

ds_list_clear(global.squad9);

global.squad0 = ds_list_create();

ds_list_clear(global.squad0);

global.primarySelect = ds_list_create();

ds_list_clear(global.primarySelect);

global.showArc = false;

global.atkPressed = false;

global.movePressed = false;

global.camera_x = 0;

global.camera_y = 0;

global.camera_right = global.camera_x + camera_get_view_width(view_camera[0]);

global.camera_bottom = global.camera_x + camera_get_view_height(view_camera[0]);

iRegion_x = 30;
iRegion_y = 540;

iRegion_length = 416;
iRegion_width = 308;

iRegion_proportion = iRegion_length/iRegion_width;

priority = 0;

if(ds_list_find_index(global.factions, "player") == 1) 
{
	Portrait_frame = Prox_frame;
}

else 
{
	Portrait_frame = icon_frame;
	
}

global.add_ability_buttons = ds_list_create();

ds_list_add(global.add_ability_buttons, 
			com_button_ability1,
			com_button_ability2,
			com_button_ability3,
			com_button_ability4,
			com_button_ability5,
			com_button_ability6,
			com_button_ability7,
			com_button_ability8,
			com_button_ability9,
			com_button_ability10,
			com_button_ability11,
			com_button_ability12,
			)