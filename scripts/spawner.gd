extends Node2D

@export var spawn_direction = 1
@onready var spawn_timer: Timer = $SpawnTimer

var car_template = preload("res://scenes/NPCcar.tscn")

# Set possible min/max wait times for cars to spawn
const minSpawnTime: float = 1
const maxSpawnTime: float = 9
const STARTING_BEHIND_X = 100 # x that the car spawns behind the player


func _ready() -> void:
	spawn_timer.wait_time = randf_range(minSpawnTime, maxSpawnTime)
	spawn_timer.start()

# Instaniates car at spawner node
func spawn_car():
	var my_car = car_template.instantiate()
	my_car.position.x = get_parent().position.x - STARTING_BEHIND_X
	my_car.position.y = position.y
	get_parent().get_parent().add_child(my_car)
	my_car.direction = spawn_direction
 
# Spawns new car and restarts timer at random interval
func _on_spawn_timer_timeout() -> void:
	spawn_car()
	spawn_timer.wait_time = randf_range(minSpawnTime, maxSpawnTime)
	spawn_timer.start()
