extends CanvasLayer

var time = Global.speedrun_time
var pause_timer = false  # To control whether the timer is running
var target_point: Vector2 = Vector2(5257, -4980)  # The point at which the timer will pause

func _physics_process(delta):
	if not pause_timer:  # Only update the timer if it is not paused
		time = float(time) + delta
		update_ui()

	check_pause_condition()

func update_ui():
	# Format time with two decimal places
	var formatted_time = str(time)
	var decimal_index = formatted_time.find(".")
	
	if decimal_index > 0:
		formatted_time = formatted_time.left(decimal_index + 2)  # Take only two decimal places
	
	Global.speedrun_time = formatted_time
	$Label.text = formatted_time

func check_pause_condition():
	# Dynamically find the player node
	var player = get_node_or_null("/root/Game4/Player4")
	if player == null:
		print("Player node not found. Ensure the path is correct.")
		return

	# Debugging: Print positions
	print("Player position:", player.global_position, "Target position:", target_point)
	
	# Pause the timer if the player is near the target point
	if player.global_position.distance_to(target_point) < 10:  # Adjust threshold as needed
		pause_timer = true
		print("Timer paused. Reached target point:", target_point)

# Call this function to set the target point dynamically
func set_target_point(point: Vector2):
	target_point = point
	print("New target point set:", target_point)
