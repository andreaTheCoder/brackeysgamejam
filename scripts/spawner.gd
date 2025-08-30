extends Node2D

@export var front = true
@onready var spawn_timer: Timer = $SpawnTimer
@onready var bike: CharacterBody2D = $"../../"

var car_template = preload("res://scenes/NPCcar.tscn")

# Set possible min/max wait times for cars to spawn
var minSpawnTime: float = 4
var maxSpawnTime: float = 10
const STARTING_BEHIND_X = 100 # x that the car spawns behind the player

func _ready() -> void:
	var my_car = spawn_car()
	my_car.position.x = position.x -  randf_range(300, 100)
	if front:
		spawn_timer.wait_time = randf_range(minSpawnTime, maxSpawnTime*.5)
	else:
		spawn_timer.wait_time = randf_range(minSpawnTime, maxSpawnTime)
	spawn_timer.start()

func _process(delta: float) -> void:
	if bike.velocity.x < 25:
		minSpawnTime = 15
		maxSpawnTime = 25
	elif bike.velocity.x < 75:
		minSpawnTime = 6
		maxSpawnTime = 10
	elif bike.velocity.x < 200:
		minSpawnTime = 3
		maxSpawnTime = 6
	else:
		minSpawnTime = 1
		maxSpawnTime = 3
	

# Instaniates car at spawner node
func spawn_car():
	var my_car = car_template.instantiate()
	if front:
		my_car.position.x = get_parent().get_parent().position.x + STARTING_BEHIND_X
	else:
		my_car.position.x = get_parent().get_parent().position.x - STARTING_BEHIND_X
	my_car.position.y = position.y
	# family tree be like
	get_parent().get_parent().get_parent().add_child.call_deferred(my_car)
	my_car.direction = 1
	return my_car
 
# Spawns new car and restarts timer at random interval
func _on_spawn_timer_timeout() -> void:
	spawn_car()
	if front:
		spawn_timer.wait_time = randf_range(minSpawnTime, maxSpawnTime*.5)
	else:
		spawn_timer.wait_time = randf_range(minSpawnTime, maxSpawnTime)
	spawn_timer.start()
