extends CharacterBody2D

# X direction movement
const X_ACCEL = 1000.0 # X direction acceleration
const MAX_SPEED = 4000
const X_DECEL = 1000 # rate at which you decelerate when spacebar is let go
# y deceleration speed
const Y_DECEL = 5

# if car is stunned stunned = 0, meaning that all acceleration is null
var stunned = false
const STUN_DURATION = 3

@onready var stun_timer: Timer = $"Stun Timer"

func _physics_process(delta: float) -> void:
	# Handle forward movement.
	if Input.is_action_pressed("forward") and not stunned: 
		velocity.x += clamp(X_ACCEL*delta, 0, MAX_SPEED) # Add the acceleration to the speed, but only until max speed
	else:
		velocity.x = max(velocity.x - X_DECEL *delta, 0) # Set velocity to the velocity minus the deceleration, but cap at 0
	
	# Handle up/down movement
	if Input.is_action_pressed("up") and not stunned:
		velocity.y -= clamp(X_ACCEL * delta, 0, MAX_SPEED) # Add the acceleration to the speed, but only until max speed
	elif Input.is_action_pressed("down") and not stunned:
		velocity.y += clamp(X_ACCEL* delta, 0, MAX_SPEED) # Add the acceleration to the speed, but only until max speed
	else:
		velocity.y = move_toward(velocity.y, 0, Y_DECEL) # moves velocity towards 0, slowing it down every from by 10 when not pressing up or down
	
	move_and_slide()

func stun():
	
	stun_timer.wait_time = STUN_DURATION
	stun_timer.start()
	stunned = true


func _on_stun_timer_timeout() -> void:
	stunned = false
