extends Node2D

var taken = false

func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		$AnimationPlayer.play("Collected")
		get_tree().call_group("Gamestate", "coin_up")

func Coin_Collected():
	queue_free()

func CoinSound():
	$CoinPickupSound.play()

