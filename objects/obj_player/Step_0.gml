// This is over all movement logic
pressing_right = keyboard_check(vk_right);
pressing_left = keyboard_check(vk_left);
move_x = pressing_right - pressing_left;

if pressing_right
{
	t_factor += 1
}
else if pressing_left
{
	t_factor -= 1
}
else
{	
	if t_factor > 0 
	{
		t_factor -= 1
	}
	else if t_factor < 0 
	{
		t_factor += 1
	}
}

// if feet touching ground
if place_meeting(x, y+3, obj_ground)
{
	move_y = 0;
	
	if keyboard_check(vk_space) 
	{
		move_y = -jump_speed;
	}
}
// if in mid air
else
{

	move_y += 1;
}

// if head touching ground
if place_meeting(x, y-3, obj_ground)
{
	move_y = -(move_y/2)
}
// if face/back touching ground
else if place_meeting(x+15, y, obj_ground_linear) || place_meeting(x-15, y, obj_ground_linear)
{	
	move_x = -(move_x/2);
	t_factor = -(t_factor/2);
}




move_x = (move_x * move_speed) + (0.1 * t_factor)
move_and_collide(move_x, move_y, obj_ground);