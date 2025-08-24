extends Node

func _process(delta: float) -> void:
	checkRespawn()

func checkRespawn():
	if Input.is_action_just_pressed("reset"):
		print("resetting game")
		get_tree().reload_current_scene()
		Engine.time_scale = 1
