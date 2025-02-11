extends Control

func _ready():
	$AnimationPlayer.play("RESET")


func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("Pause")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("Pause")

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()

func _process(delta):
	testEsc()

func _on_resume_pressed():
	resume()

func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()
	
func _on_levels_pressed():
	get_tree().change_scene_to_file("res://LevelSelect.tscn")
