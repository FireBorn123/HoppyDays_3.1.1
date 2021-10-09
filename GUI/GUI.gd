extends CanvasLayer

func _ready():
	$Control/TextureRect/VBoxContainer/HealthCounter.text = "3"
	

func UpdateLifeCount(Lives_left):
	$Control/TextureRect/VBoxContainer/HealthCounter.text = str(Lives_left)
	
