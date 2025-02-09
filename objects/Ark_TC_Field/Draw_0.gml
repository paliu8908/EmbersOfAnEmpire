/// @description Insert description here
// You can write your code in this editor

//transform given points. 

depth = 25;

direction = owner.direction - 90;

ty1 = -sqrt(sqr(rect[0])+sqr(rect[1])) * sin(degtorad((darctan2(rect[0], rect[1]) + direction)));
tx1 = sqrt(sqr(rect[0])+sqr(rect[1])) * cos(degtorad((darctan2(rect[0], rect[1]) + direction)));

ty2 = -sqrt(sqr(rect[3])+sqr(rect[4])) * sin(degtorad((darctan2(rect[3], rect[4]) + direction)));
tx2 = sqrt(sqr(rect[3])+sqr(rect[4])) * cos(degtorad((darctan2(rect[3], rect[4]) + direction)));

ty3 = -sqrt(sqr(rect[3])+sqr(rect[1])) * sin(degtorad((darctan2(rect[3], rect[1]) + direction)));
tx3 = sqrt(sqr(rect[3])+sqr(rect[1])) * cos(degtorad((darctan2(rect[3], rect[1]) + direction)));

ty4 = -sqrt(sqr(rect[0])+sqr(rect[2])) * sin(degtorad((darctan2(rect[0], rect[2]) + direction)));
tx4 = sqrt(sqr(rect[0])+sqr(rect[2])) * cos(degtorad((darctan2(rect[0], rect[2]) + direction)));

ty5 = -sqrt(sqr(rect[3])+sqr(rect[2])) * sin(degtorad((darctan2(rect[3], rect[2]) + direction)));
tx5 = sqrt(sqr(rect[3])+sqr(rect[2])) * cos(degtorad((darctan2(rect[3], rect[2]) + direction)));

ty6 = -sqrt(sqr(rect[3])+sqr(rect[5])) * sin(degtorad((darctan2(rect[3], rect[5]) + direction)));
tx6 = sqrt(sqr(rect[3])+sqr(rect[5])) * cos(degtorad((darctan2(rect[3], rect[5]) + direction)));

draw_triangle_color(owner.x + tx1, owner.y + ty1, owner.x + tx2, owner.y + ty2, owner.x + tx3, owner.y + ty3, c_yellow, c_yellow, c_yellow, false);
draw_triangle_color(owner.x + tx1, owner.y + ty1, owner.x + tx3, owner.y + ty3, owner.x + tx4, owner.y + ty4, c_yellow, c_yellow, c_yellow, false);
draw_triangle_color(owner.x + tx3, owner.y + ty3, owner.x + tx4, owner.y + ty4, owner.x + tx5, owner.y + ty5, c_yellow, c_yellow, c_yellow, false);
draw_triangle_color(owner.x + tx5, owner.y + ty5, owner.x + tx6, owner.y + ty6, owner.x + tx4, owner.y + ty4, c_yellow, c_yellow, c_yellow, false);