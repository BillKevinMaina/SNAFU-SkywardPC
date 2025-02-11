extends Node2D

@onready var animatedSprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collisionShape: CollisionShape2D = $KIlllzone/CollisionShape2D

var health = 1

func process(delta):
	if health <= 0:
		collisionShape.disabled = true  # Corrected the typo: `disable` -> `disabled`
		set_physics_process(false)

func set_animation():
	if health <= 0:
		animatedSprite.play("death")  # Play death animation

func _on_get_damage_body_entered(body):
	if "Player" in body.name:
		health -= 1
		set_animation()  # Ensure animation is triggered when health is reduced

func _on_animated_sprite_2d_animation_finished():
	if animatedSprite.animation == "death":
		queue_free()  # Remove the object after death animation is finished
