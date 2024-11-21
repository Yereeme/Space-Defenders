extends CharacterBody2D
# Creating a smooth character movement
# Creating a player shoot
# Youtube Link: 

const max_speed = 400
const accel = 1500
const friction = 600
# Friction means slowing down speed movement 

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("Right")) - int(Input.is_action_pressed("Left"))
	input.y = int(Input.is_action_pressed("Down")) - int(Input.is_action_pressed("Up"))
	return input.normalized()

func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else: 
		velocity += (input * accel * delta)
		velocity =  velocity.limit_length(max_speed)
	
	move_and_slide()

func _unhandled_key_input(event: InputEvent) -> void:
	if (event.is_action_pressed("Shoot")):
		$LaserWeapon.shoot()
