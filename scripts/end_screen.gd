extends Node2D

const GAME = preload("res://scenes/game.tscn")
var game_scene:PackedScene = load("res://scenes/game.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dynamic_font = FontFile.new()
	dynamic_font.font_data = load("res://assets/brackeys_platformer_assets 2/fonts/PixelOperator8-Bold.ttf")
	var button = Button.new()
	button.set_position(Vector2(1000, 1300))
	button.size = Vector2(1000, 100)
	button.text = "Next delivery"
	button.add_theme_font_override("font", dynamic_font)
	button.pressed.connect(_button_pressed)
	add_child(button)

func _button_pressed():
	print("Next delivery!")
	get_tree().change_scene_to_packed(game_scene)

func _process(_delta: float) -> void:
	if Input.is_action_pressed("button"):
		get_tree().change_scene_to_packed(game_scene)
