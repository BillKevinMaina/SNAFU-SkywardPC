extends TouchScreenButton

@export_file var levels_path

var tween := create_tween()


func _on_pressed():
	if levels_path == null:
		return
		get_tree().change_scene_to_file(levels_path)
