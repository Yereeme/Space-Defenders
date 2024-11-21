extends Area2D

var direction := Vector2(1, 0)
var projectile_speed := 1000

func _process(delta: float) -> void:
	self.position += direction * projectile_speed * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
