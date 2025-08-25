extends Area2D

@export var SPEED = 1000

func _process(delta: float) -> void:
	position.x += -SPEED * delta

func _on_body_entered(body: Node2D) -> void:
	print("this car was hit")
