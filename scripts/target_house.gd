extends Area2D

const BIKE = preload("res://scenes/bike.tscn")
var at_house = false
var game_over_scene:PackedScene = load("res://scenes/end_screen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if at_house and Input.is_action_pressed("deliver"):
		get_tree().change_scene_to_packed(game_over_scene)

func _on_body_entered(body: Node2D) -> void:
	at_house = true


func _on_body_exited(body: Node2D) -> void:
	at_house = false
