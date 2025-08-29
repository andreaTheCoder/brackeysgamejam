extends Node

@onready var timer: Timer = $"../UI elements/time label/Timer"
@onready var time_label: Label = $"../UI elements/time label"
@onready var money: Label = $"../UI elements/money"
const target_house_prefab = preload("res://scenes/target_house.tscn")
var delivery_time = 0
var house_distance = 10
var difficulty = 0.7 # smaller number = harder because less time
const base_payment = 5
var balance = 0
const DELIVERIES_PER_DAY = 3
var time_remaining
var current_house_x = 250
var delivery_count = 1


func _ready() -> void:
	start_delivery(house_distance)
	for i in range(DELIVERIES_PER_DAY):
		print("house clone created")
		var instance = target_house_prefab.instantiate()
		instance.position = Vector2(current_house_x, -50)
		current_house_x += 250
		get_parent().call_deferred("add_child", instance)
func _process(_delta: float) -> void:
	checkRespawn()
	time_remaining = int(ceil(timer.time_left))
	time_label.text = "Time: " + str(time_remaining)

# Run when you click a start button
func start_delivery(distance: int) -> void:
	delivery_time = distance * difficulty
	money.text = "$" + str(Global.coins)
	timer.wait_time = int(delivery_time)
	timer.start()
	print("delivery started")

func _on_timer_timeout() -> void:
	print("Ran out of time!")
	timer.stop()

func complete_delivery():
	timer.stop()
	balance = (base_payment + time_remaining * difficulty)
	print("base_paument" + str(base_payment))
	print(time_remaining)
	print(balance)
	Global.coins += balance
	money.text = "$" + str(Global.coins)
	timer.start()

# Reset button
func checkRespawn():
	if Input.is_action_just_pressed("reset"):
		print("resetting game")
		get_tree().reload_current_scene()
		Engine.time_scale = 1
