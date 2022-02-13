extends Node2D

var lives = 3
var coins = 0
var coinsToLives = 10

func _ready():
	add_to_group("Gamestate")
	update_GUI()
	print(lives)
	
func GetLives():
	return lives

func hurt():
	lives -= 1
	$Player.hurt()
	update_GUI()
	if lives <= 0:
		End_Game()
	print(lives)

func update_GUI():
	get_tree().call_group("GUI", "UpdateGUI", lives, coins)

func coin_up():
	coins += 1
	update_GUI()
	var multipleOfCoins = (coins % coinsToLives) == 0
	if multipleOfCoins:
		addLives()

func addLives():
	lives += 1
	update_GUI()

func End_Game():
	get_tree().change_scene("res://Levels/GameOver.tscn")


func Win_Game():
	get_tree().change_scene("res://Levels/Victory.tscn")
