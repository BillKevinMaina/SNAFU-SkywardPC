class_name MainMenu
extends Control

@onready var start: TouchScreenButton = $Menu/MarginContainer/PanelContainer/VBoxContainer/ButtonContainer/Button/Start
@onready var levels: TouchScreenButton = $Menu/MarginContainer/PanelContainer/VBoxContainer/ButtonContainer2/Levels/Levels
@onready var quit: TouchScreenButton = $Menu/MarginContainer/PanelContainer/VBoxContainer/ButtonContainer3/Button2/Quit



func _on_start_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_levels_pressed():
	get_tree().change_scene_to_file("res://LevelSelect.tscn")
