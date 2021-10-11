extends CanvasLayer

func _ready():
	$Control/TextureRect/VBoxContainer/HealthCounter.text = "3"

func UpdateGUI(Lives_left, coins):
	$Control/TextureRect/VBoxContainer/HealthCounter.text = str(Lives_left)
	$Control/TextureRect/VBoxContainer/CoinCounter.text = str(coins)

