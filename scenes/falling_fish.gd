extends RigidBody2D

@export var sceneName = "LoseScreen"

func _on_FallArea_body_entered(body):
	if body.get_name() == "Player":  
		get_tree().change_scene_to_file("res://scenes/" + sceneName + ".tscn")  # Pindah ke layar kekalahan
	else:
		await get_tree().create_timer(3.2).timeout  # Tunggu 5 detik
		body.queue_free()  # Hapus objek setelah 5 detik
