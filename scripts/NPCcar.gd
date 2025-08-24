extends Area2D

@export var SPEED = -600

func _process(delta: float) -> void:
	position.x += SPEED * delta
