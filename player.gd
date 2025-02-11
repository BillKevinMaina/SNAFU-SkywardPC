class_name Player extends CharacterBody2D

const SPEED = 135.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var value = 0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Define teleportation vectors
var teleport_input: Vector2 = Vector2(-4608, -965) # Position to check for teleportation
var teleport_output: Vector2 = Vector2(-4141, -940) # Target position after teleportation
var teleport_radius: float = 20.0 # Radius around the input position to trigger teleportation

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the direction + -1 0 or 1
	var direction := Input.get_axis("move_left", "move_right")

	# Flips the sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	# Play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("Idle")
		else:
			animated_sprite.play("Run")
	else:
		animated_sprite.play("Jump")

	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Check for teleportation
	check_teleportation()

func check_teleportation() -> void:
	# Check if the player is within teleport radius of the input position
	if position.distance_to(teleport_input) <= teleport_radius:
		teleport()

func teleport() -> void:
	# Teleport the player to the output position
	position = teleport_output
