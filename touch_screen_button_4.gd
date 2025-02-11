extends TouchScreenButton

@export_file var game4_path

var tween := create_tween()


func _on_pressed():
	if game4_path == null:
		return
		get_tree().change_scene_to_file(game4_path)
