extends Node2D

const speed = 70

var direction = 1


@onready var ray_cast_left: RayCast2D = $RayCastLEFT
@onready var ray_cast_right: RayCast2D = $RayCastRIGHT
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

#called every frame. 'delta' is time elapsed since the last frame
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
	animated_sprite.flip_h = false
	
	
	position.x += direction * speed * delta
