extends Control

func _ready():
	pass 


func _on_PlayAgainButton_button_down():
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_QuitButton_button_down():
	get_tree().quit()
