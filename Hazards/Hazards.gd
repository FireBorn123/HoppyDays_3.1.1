extends Area2D



func _on_SpikeTop_body_entered(body):
#	if body.has_method("Hurt"):
#		body.Hurt()
	get_tree().call_group("Gamestate", "hurt")
	

