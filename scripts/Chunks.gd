extends Area2D


var chunk_template = preload("res://scenes/lane.tscn")
var chunk_num = 1

func _on_body_entered(_body: Node2D) -> void:
	var chunk = chunk_template.instantiate()
	chunk.position.x = chunk_num * 256
	call_deferred("add_child", chunk)
