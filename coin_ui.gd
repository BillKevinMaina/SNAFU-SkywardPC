extends Control

@onready var label: Label = $Label

func _ready():
	EventController.connect("coin_collected", on_event_coin_collected)

func on_event_coin_collected(value: int):
	label.text = str(value)
	


func _on_levels_pressed():
	get_tree().change_scene_to_file("res://LevelSelect.tscn")
