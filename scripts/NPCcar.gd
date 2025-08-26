extends Area2D

@export var SPEED = 1000
@onready var bike: CharacterBody2D = $"../../Bike"


func _process(delta: float) -> void:
	position.x += -SPEED * delta

func _on_body_entered(body: Node2D) -> void:
	print("this car was stunned")
	bike.stun()
