/// @description Insert description here
// You can write your code in this editor

maxHp = hp;
maxSpeed = move_speed;
dodgeCounter = 0;

ifQuivSup = false;

move_x = 0;

move_y = 0;

moveXList = ds_list_create();

moveYList = ds_list_create();

ds_list_clear(moveXList);
ds_list_clear(moveYList);

target_x = 0;

target_y = 0;

if_reload = 0;

reload_counter = 0;

burst_counter = 0;

if_burst = 0

if_shoot = false;

if_move = false;

target = 0;

img = 0;

attackTargets = ds_list_create();

/*shroud_clear_grid = fog_reveal_setup(reveal_distance, game_fog.clear_grid_size);*/

onMapSize = 2;

destinationDirection = 0;

select_radius = min(sprite_height div 2, sprite_width div 2);

direction = 0;

maxHp = hp;

atkOrder = false;

outOfCombat = true;

combatlessCounter = 0;

hasShield = false;


randomize();
			
angle = random_range(-fireAngle, fireAngle);

acceleration = acceleration/30;

stunnedCounter = 0;

stun = false;

_shockFrame = 0;

standAcceleration = acceleration;

supframe = 0;

buttons = ds_list_create();

placement = ds_list_create();

ds_list_clear(buttons);

ds_list_add(buttons, com_button_move.id, com_button_atk.id, com_button_stop.id, com_button_patrol.id);

repairs = false;

canCarry = false;

standRange = range;

abilities = [
			];
			
effects = [
			];
			
			//type, time, change amount
			//types: EMP, Armour Reduction, slow, boost