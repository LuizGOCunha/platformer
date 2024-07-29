// To be executed every frame

check_move_keys()
check_collision()


move_x = (move_x * move_speed) + (0.1 * t_factor)
move_and_collide(move_x, move_y, obj_ground);

