extends Node2D
@export var sceneName = "LoseScreen"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":  
		get_tree().change_scene_to_file("res://scenes/" + sceneName + ".tscn") # Replace with function body.
