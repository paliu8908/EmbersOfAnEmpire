/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

instance_create_layer(x, y, "instances", com_slowfield, 
{
	existingTime : effectDuration * 60,
	image_xscale : 2 * effectRadius/100,
	image_yscale : 2 * effectRadius/100,
	plasma_radius : effectRadius,
	damageTime : 1,
	effectName : "KeplerSpeedBoost",
	speedReduction : speedReduction
});


