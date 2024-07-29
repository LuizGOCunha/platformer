// movement variables
move_x = 0; // how many pixels it will move in the x line
move_y = 0; // how many pixels it will move in the y line

// speed variables
move_speed = 1; // will multiply the amount of frames moved
jump_speed = 24; // force exerced on a vertical jump

// acceleration variables
t_factor = 0 //time factor of acceleration, which here will be equivalent to frames

//button check variables
pressing_right = 0; 
pressing_left = 0;


function check_move_keys()
// Checks key movement and adjusts t_factor and move_x
{
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
}

function check_collision()
// Checks collision of player into ground objects and adjusts movement based on that
{	
	// if feet touching ground
	if place_meeting(x, y+3, obj_ground)
	{
		show_debug_message("FEET TOUCHING GROUND")
		move_y = -(move_y/4);
		// if jumping
		if keyboard_check(vk_space) 
		{
			move_y = -jump_speed;
		}
	}
	// if in mid air
	else
	{
		show_debug_message("MID AIR")
		move_y += 1;
	}

	// if head touches ground
	if place_meeting(x, y-3, obj_ground)
	{
		show_debug_message("HEAD TOUCHES GROUND")
		move_y = -(move_y/2)
	}
	// if face/back touching ground
	if place_meeting(x+15, y, obj_ground_linear) || place_meeting(x-15, y, obj_ground_linear)
	{	
		show_debug_message("FACE TOUCHING GROUND")
		move_x = -(move_x/2);
		t_factor = -(t_factor/2);
	}
}