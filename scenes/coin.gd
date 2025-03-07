extends Node2D

func _on_coin_collected(body):
	if body.get_name() == "Player":  
		queue_free()  
