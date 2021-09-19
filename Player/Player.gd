extends KinematicBody2D

var motion = Vector2(0, 0)

const SPEED = 1200
const GRAVITY = 400
const UP = Vector2(0, -1)
const JUMP_SPEED = 4000
const World_Limit = 3000
const BoostMultiplyer = 2

var lives = 3

signal animate

func _physics_process(delta):
	
	apply_gravity()
	jump()
	move_left_and_right()
	animate()
	move_and_slide(motion, UP)
	
func apply_gravity():
	if position.y >= World_Limit:
		End_Game()
	if  is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY

func jump():
	if Input.is_action_pressed("Jump") && is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSFX.play()

func move_left_and_right():
	if Input.is_action_pressed("Left") and not Input.is_action_pressed("Right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("Right") and not Input.is_action_pressed("Left"):
		motion.x = SPEED
	else: 
		motion.x = 0
	
func animate():
	emit_signal("animate", motion)


func End_Game():
	get_tree().change_scene("res://Levels/GameOver.tscn")

func Hurt():
	print("LivesBefore: ", lives)
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED
	$PainSFX.play()
	lives -= 1
	print("LivesAfter: ", lives)
	if lives <= 0:
		End_Game()


func boost():
	position.y -= 100
	yield(get_tree(), "idle_frame")
	motion.y -= BoostMultiplyer * JUMP_SPEED
