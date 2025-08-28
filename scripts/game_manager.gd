extends Node

@onready var timer: Timer = $"../UI elements/time label/Timer"
@onready var time_label: Label = $"../UI elements/time label"
@onready var money: Label = $"../UI elements/money"
@onready var speed_up_timer: Timer = $"SpeedUp timer"

var delivery_time = 0
var house_distance = 10
var difficulty = 0.7 # smaller number = harder because less time
const base_payment = 5
var balance = 0

var time_remaining

func _ready() -> void:
	start_delivery(house_distance)
	Engine.time_scale = 100
	speed_up_timer.wait_time = .5
	speed_up_timer.start()
func _process(delta: float) -> void:
	checkRespawn()
	time_remaining = int(ceil(timer.time_left))
	time_label.text = str(time_remaining)

# Run when you click a start button
func start_delivery(distance: int) -> void:
	delivery_time = distance * difficulty
	set_balance(balance)
	timer.wait_time = int(delivery_time)
	timer.start()
	print("delivery started")

func _on_timer_timeout() -> void:
	print("Ran out of time!")
	timer.stop()

func complete_delivery():
	print("You delivered my pizza with ", time_remaining, " seconds remaining")
	timer.stop()
	balance += (base_payment + time_remaining * difficulty)
	set_balance(balance)

func set_balance(balance):
	Global.coins += balance
	money.text = "$" + str(Global.coins)
# Reset button
func checkRespawn():
	if Input.is_action_just_pressed("reset"):
		print("resetting game")
		get_tree().reload_current_scene()
		Engine.time_scale = 1
