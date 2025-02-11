extends Node

var save_path  = "user://save_file.save"

var total_coin: int = 0

func coin_collected(value: int):
	total_coin += value
	EventController.emit_signal("coin_collected", total_coin)


func save_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(total_coin)

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ) 
		total_coin = file.get_var(total_coin)
	else:
		print("No data Saved...")
		total_coin = 0
