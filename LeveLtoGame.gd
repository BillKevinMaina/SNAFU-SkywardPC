extends TouchScreenButton

@export_file var game_path

var tween := create_tween()


func _on_pressed():
	if game_path == null:
		return
		get_tree().change_scene_to_file(game_path)
