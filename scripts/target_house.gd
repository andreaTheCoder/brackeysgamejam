extends Area2D

@onready var game_manager = $"../Game Manager"
@onready var deliveries_left: Label = $"../UI elements/deliveries left"
@onready var house_sprite: Sprite2D = $House
@onready var delivery_label = get_tree().get_root().get_node("game").get_node("%UI elements/delivery label")
@onready var timer: Timer = $"../UI elements/time label/Timer"

const BIKE = preload("res://scenes/bike.tscn")
const BLUE_ARROW = preload("res://assets/handmade/blue_arrow.webp")
const HOUSE_IMG = preload("res://assets/handmade/white_arrow.webp")
var at_house = false
var game_over_scene:PackedScene = load("res://scenes/end_screen.tscn")
var delivered = false
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if at_house and Input.is_action_just_pressed("deliver") and !delivered:
		game_manager.complete_delivery()
		delivered = true #prevents player from spamming deliver at 1 house
		print ("delivery count ", game_manager.delivery_count)
		deliveries_left.text = "Deliveries Remaining: " + str(Global.DELIVERIES_PER_DAY - game_manager.delivery_count)
		if game_manager.delivery_count == Global.DELIVERIES_PER_DAY:
			get_tree().change_scene_to_packed(game_over_scene)
			game_manager.delivery_count = 0
		else:
			timer.stop()
			game_manager.delivery_count += 1
			timer.wait_time = game_manager.delivery_time
			timer.start()
		#game_manager.complete_delivery()

func _on_body_entered(_body: Node2D) -> void:
		at_house = true
		house_sprite.texture = BLUE_ARROW
		delivery_label.visible = true

func _on_body_exited(_body: Node2D) -> void:
	at_house = false
	house_sprite.texture = HOUSE_IMG
	delivery_label.visible = false
