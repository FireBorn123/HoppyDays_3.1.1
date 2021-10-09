extends Node2D

var lives = 3

func _ready():
	add_to_group("Gamestate")
	Update_GUI()
	print(lives)
	
func GetLives():
	return lives

func hurt():
	lives -= 1
	$Player.hurt()
	Update_GUI()
	if lives <= 0:
		End_Game()
	print(lives)

func Update_GUI():
	get_tree().call_group("GUI", "UpdateLifeCount", lives)

func End_Game():
	get_tree().change_scene("res://Levels/GameOver.tscn")
