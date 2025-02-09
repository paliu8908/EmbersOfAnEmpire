/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
depth = 25;

if_ready = false;

dmgCounter = 0;

target = 0;

timeAlive = 0;

hitUnit = 0;

explodeType = invisible;

colourOne = c_yellow;

colourTwo = c_yellow;

dmgIncreaseTime = 60 * 1; // 1 of a frame if running at 30 fps

dmgIncreaseAmount = 1;

dmgIncreaseCounter = 0;

sprite = Ace_Phosphor;

areaAngle = 5;

fieldColour = make_colour_rgb(255, 204, 102);

tx1 = 0;
tx2 = 0;
tx3 = 0;

armourReduce = -2;