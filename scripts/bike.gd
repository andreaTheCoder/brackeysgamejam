extends CharacterBody2D


const SPEED = 300.0
const ACCELERATION = 500.0
const MAX_SPEED = 4000
const BRAKE_SPEED = 10

func _physics_process(delta: float) -> void:
	# Handle jump.
	if Input.is_action_pressed("forward"):
		velocity.x += clamp(ACCELERATION*delta, 0, MAX_SPEED)
	else:
		velocity.x = clamp((velocity.x - BRAKE_SPEED) *delta, MAX_SPEED, 0)
		
	print(velocity.x)
	# Get the input direction and handle the movement/deceleration.


	move_and_slide()
