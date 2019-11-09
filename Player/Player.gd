extends KinematicBody2D

var motion = Vector2(0, 0)

const SPEED = 500
const GRAVITY = 400
const UP = Vector2(0, -1)
const JUMP_SPEED = 3000

func _physics_process(delta):
	
	apply_gravity()
	jump()
	move_left_and_right()
	move_and_slide(motion, UP)
	
func apply_gravity():
	if not is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0

func jump():
	if Input.is_action_just_pressed("Jump") && is_on_floor():
		motion.y -= JUMP_SPEED

func move_left_and_right():
	if Input.is_action_pressed("Left") and not Input.is_action_pressed("Right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("Right") and not Input.is_action_pressed("Left"):
		motion.x = SPEED
	else: 
		motion.x = 0
	