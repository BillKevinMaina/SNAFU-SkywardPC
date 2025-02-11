extends HSlider

const main_scene: PackedScene = preload("res://game.tscn")
const main_menu_scene: PackedScene = preload("res://main_menu.tscn")  # Replace with the actual path to your main menu scene

@onready var back_to_menu: TouchScreenButton = $"../ButtonContainer2/Main_Menu"
@onready var new_game: TouchScreenButton = $"../ButtonContainer/Start"
@onready var options_menu: CanvasLayer = $"../.."  # Parent node representing the options menu

@export var bus_name: String  # Name of the audio bus for volume control

var bus_index: int

func _ready():
	# Get the audi$"../ButtonContainer2/Main_Menu"o bus index and connect slider value change signal
	bus_index = AudioServer.get_bus_index(bus_name)
	connect("value_changed", _on_value_changed)
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))

	# Check if the game is already started
	if Global.is_game_started:
		load_game_scene()  # Skip menu and load the main game scene
	else:
		load_main_menu()  # Show the main menu
	




func _on_value_changed(value: float):
	# Update the audio volume based on the slider value
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))

func load_main_menu():
	# Connect the start button signal
	new_game.connect("pressed", _on_new_game_pressed)


func _on_new_game_pressed():
	# Mark the game as started and load the game scene
	Global.is_game_started = true
	load_game_scene()

func load_game_scene():
	# Ensure the options menu is removed before switching scenes
	if options_menu:
		options_menu.queue_free()  # Remove the options menu from the scene tree

	# Instantiate and add the game scene
	var game_scene = main_scene.instantiate()
	get_tree().root.add_child(game_scene)  # Add the game scene to the root of the scene tree
