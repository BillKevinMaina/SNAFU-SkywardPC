extends TouchScreenButton

@export_file var game2_path

var tween := create_tween()


func _on_pressed():
	if game2_path == null:
		return
		get_tree().change_scene_to_file(game2_path)
