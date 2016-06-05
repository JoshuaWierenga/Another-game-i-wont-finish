//Check movement buttons
right_key = keyboard_check(vk_right);
left_key = -keyboard_check(vk_left);
up_key = keyboard_check_pressed(vk_space);

//Move
move = right_key + left_key;
horspeed = move * movespeed;

verspeed += grav;

//X movement on gravity_Object
if (place_meeting(x, y+1, gravity_Object))
{
    if (up_key) verspeed = -jumpspeed;
}
    
if (place_meeting(round(x+horspeed), round(y), gravity_Object))
{
    while(!place_meeting(round(x+sign(horspeed)), round(y), gravity_Object))
    {
        x += sign(horspeed);
    }
    horspeed = 0;
}

if (Control_Object.allow_move)
{
    x += horspeed;
}

//Y movement on gravity_Object
if (place_meeting(round(x), round(y+verspeed), gravity_Object))
{
    while(!place_meeting(round(x), round(y+verspeed), gravity_Object))
    {
        x += sign(verspeed);
    }
    verspeed = 0;
}

if (Control_Object.allow_move)
{   
    y += verspeed;
}
