extends Node2D

const GAME = preload("res://scenes/game.tscn")
var game_scene:PackedScene = load("res://scenes/game.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var button = Button.new()
	button.set_position(Vector2(500, 300))
	button.text = "Next delivery"
	button.pressed.connect(_button_pressed)
	add_child(button)

func _button_pressed():
	print("Hello world!")
	get_tree().change_scene_to_packed(game_scene)
