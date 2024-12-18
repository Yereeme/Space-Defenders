extends CharacterBody2D

@export var speed: float = 100.0  # Speed of the enemy
@export var bullet_scene: PackedScene = preload("res://Enemies/Scripts/enemy_bullet.tscn")
@export var shooting_interval: float = 1.5  # Time between shots in seconds

func _ready() -> void:
	# Create a timer to handle shooting
	var shooting_timer = Timer.new()
	shooting_timer.wait_time = shooting_interval
	shooting_timer.autostart = true
	shooting_timer.one_shot = false
	add_child(shooting_timer)
	shooting_timer.timeout.connect(Callable(self, "_on_shooting_timer_timeout"))

func _physics_process(delta: float) -> void:
	velocity = Vector2(-speed, 0)  # Move the enemy leftward
	move_and_slide()

func _on_shooting_timer_timeout() -> void:
	# Spawn a new bullet
	var bullet = bullet_scene.instantiate()
	bullet.position = $Muzzle.global_position  # Spawn bullet from the Muzzle position
	bullet.direction = Vector2.LEFT  # Set bullet direction to left
	get_tree().current_scene.add_child(bullet)  # Add bullet to the current scene
