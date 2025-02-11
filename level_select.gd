extends Control

func _on_touch_screen_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_touch_screen_button_2_pressed():
	get_tree().change_scene_to_file("res://game_2.tscn")


func _on_touch_screen_button_3_pressed():
	get_tree().change_scene_to_file("res://game_3.tscn")


func _on_touch_screen_button_4_pressed():
	get_tree().change_scene_to_file("res://game_4.tscn")


func _on_quit_pressed():
	get_tree().quit()
