extends CharacterBody2D

# X direction movement
const ACCELERATION = 1000.0
const MAX_SPEED = 4000
const BRAKE_SPEED = 1000 # rate at which you decelerate when spacebar is not pressed

# Y direciton movement
var y_direction = 1 #1 means down, -1 means up

# Lane Boundaries
const MAX_Y_POS = 400
const MIN_Y_POS = -400

func _physics_process(delta: float) -> void:
	# Handle forward movement.
	if Input.is_action_pressed("forward"):
		velocity.x += clamp(ACCELERATION*delta, 0, MAX_SPEED) # Add the acceleration to the speed, but only until max speed
	else:
		velocity.x = max(velocity.x - BRAKE_SPEED*delta, 0) # Set velocity to the velocity minus the deceleration, but cap at 0
		
	print(velocity.x)
	
	# Get the input direction and handle the movement/deceleration.
	#y_direction = Input.get_axis("up", "down")
	#print(y_direction)
	#if y_direction>0: # bike is moving down
	#	velocity.y= clamp(ACCELERATION*delta, 0, MAX_SPEED)
	
	#else:
	#	velocity.y = clamp((velocity.y - BRAKE_SPEED) *delta, MAX_SPEED, 0)

	move_and_slide()
