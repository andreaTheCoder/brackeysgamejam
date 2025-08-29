extends Area2D

const SPEED = 20
var direction = -1
@onready var bike: CharacterBody2D = $"../Bike"

func _process(delta: float) -> void:
	position.x += SPEED * delta * direction

func _on_body_entered(_body: Node2D) -> void:
	print("this car was stunned")
	bike.stun()
