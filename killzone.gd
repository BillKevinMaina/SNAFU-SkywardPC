extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body):
	print("PLAYER DIED")
	Engine.time_scale = 0.5
	# Safely attempt to free CollisionShape2D if it exists on the body
	var collision_shape = body.get_node_or_null("CollisionShape2D")
	if collision_shape:
		collision_shape.queue_free()
	
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
