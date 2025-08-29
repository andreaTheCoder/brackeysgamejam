extends Area2D

@onready var game_manager = $"../Game Manager"

@onready var house_sprite: Sprite2D = $House
@onready var delivery_label = get_tree().get_root().get_node("game").get_node("%UI elements/delivery label")

const BIKE = preload("res://scenes/bike.tscn")
const GREEN_HOUSE_IMG = preload("res://assets/Green house.png")
const HOUSE_IMG = preload("res://assets/house.jpg")
var at_house = false
var game_over_scene:PackedScene = load("res://scenes/end_screen.tscn")
var delivered = false
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if at_house and Input.is_action_just_pressed("deliver") and !delivered:
		delivered = true #prevents player from spamming deliver at 1 house
		print (game_manager.delivery_count)
		if game_manager.delivery_count == 3:
			get_tree().change_scene_to_packed(game_over_scene)
			game_manager.delivery_count = 0
		else:
			game_manager.delivery_count += 1
			
		game_manager.complete_delivery()

func _on_body_entered(_body: Node2D) -> void:
		at_house = true
		house_sprite.texture = GREEN_HOUSE_IMG
		delivery_label.visible = true

func _on_body_exited(_body: Node2D) -> void:
	at_house = false
	house_sprite.texture = HOUSE_IMG
	delivery_label.visible = false
