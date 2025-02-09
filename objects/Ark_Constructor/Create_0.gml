/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(!instance_exists(com_button_unpack))
{
	instance_create_layer(-100, 0, "instances", com_button_unpack);
}

event_inherited();

selectSprite = spr_constructors_select;

maxSprites = 4;

weapon = Ark_Fighter_burst;

sprite = spr_constructors;

ds_list_add(buttons, com_button_unpack);

unpacking = false;

image_xscale = 1;

image_yscale = 1;

blurb += name;

string_delete(blurb, string_length(blurb) - 5, 5);

producedSpeed = 1