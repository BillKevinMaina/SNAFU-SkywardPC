extends TouchScreenButton

@export_file var path

var tween := create_tween()


func _on_pressed():
	if path == null:
		return
		get_tree().change_scene_to_file(path)
