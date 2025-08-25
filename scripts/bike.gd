extends CharacterBody2D

# X direction movement
const X_ACCEL = 1000.0 # X direction acceleration
const MAX_SPEED = 4000
const X_DECEL = 1000 # rate at which you decelerate when spacebar is let go

# y deceleration speed
const Y_DECEL = 5


func _physics_process(delta: float) -> void:
	# Handle forward movement.
	if Input.is_action_pressed("forward"):
		velocity.x += clamp(X_ACCEL*delta, 0, MAX_SPEED) # Add the acceleration to the speed, but only until max speed
	else:
		velocity.x = max(velocity.x - X_DECEL*delta, 0) # Set velocity to the velocity minus the deceleration, but cap at 0
		
	
	# Handle up/down movement
	if Input.is_action_pressed("up"):
		velocity.y -= clamp(X_ACCEL*delta, 0, MAX_SPEED) # Add the acceleration to the speed, but only until max speed
	elif Input.is_action_pressed("down"):
		velocity.y += clamp(X_ACCEL*delta, 0, MAX_SPEED) # Add the acceleration to the speed, but only until max speed
	else:
		velocity.y = move_toward(velocity.y, 0, Y_DECEL) # moves velocity towards 0, slowing it down every from by 10 when not pressing up or down
	
	move_and_slide()
