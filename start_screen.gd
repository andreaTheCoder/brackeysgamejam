extends Node2D

const GAME = preload("res://scenes/game.tscn")
var game_scene:PackedScene = load("res://scenes/game.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("hello")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
func _process(_delta: float) -> void:
	if Input.is_action_pressed("button"):
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		get_tree().change_scene_to_packed(game_scene)
	
	
func _on_play_pressed() -> void:
	print("play")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	get_tree().change_scene_to_packed(game_scene)
