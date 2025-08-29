extends Area2D

@onready var game: Node2D = $"."
var chunk_template = preload("res://scenes/chunk.tscn")
var chunk_num = 1

func _on_body_entered(_body: Node2D) -> void:
	var chunk = chunk_template.instantiate()
	chunk.position.x = chunk_num * 256
	get_parent().call_deferred("add_child", chunk)
