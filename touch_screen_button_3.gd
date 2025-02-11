extends TouchScreenButton

@export_file var game3_path

var tween := create_tween()


func _on_pressed():
	if game3_path == null:
		return
		get_tree().change_scene_to_file(game3_path)
