extends Node2D

var lives = 3

func _ready():
	add_to_group("Gamestate")
	print(lives)

func hurt():
	lives -= 1
	$Player.hurt()
	if lives <= 0:
		End_Game()
	print(lives)

func End_Game():
	get_tree().change_scene("res://Levels/GameOver.tscn")
