extends CharacterBody2D

@export var speed: float = 200.0  # Speed of the bullet
var direction: Vector2 = Vector2.LEFT  # Default direction

func _ready() -> void:
	velocity = direction * speed  # Set the initial velocity

func _physics_process(delta: float) -> void:
	move_and_slide()  # Move the bullet based on velocity

	# Remove the bullet if it goes off-screen
	if position.x < 0 or position.x > get_viewport_rect().size.x:
		queue_free()
