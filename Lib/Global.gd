extends Node

const default_data = "extends Node\n\nfunc _ready() -> void:\n\tprint('I am a cat!')"

var SAVEPATH : String = "user://"
func _ready() -> void:
	SAVEPATH = OS.get_executable_path().get_base_dir() + "/save/"
	DirAccess.make_dir_absolute(SAVEPATH)
	
	# test
	print(SAVEPATH)
	save_temp()
	run_save("Hello")

func run_save(script_name : String) -> void:
	var script = load(SAVEPATH + script_name + ".gd").new()
	add_child(script)

func save_temp(script_name : String = "Hello", data : String = default_data) -> void:
	var save_data = FileAccess.open(SAVEPATH + script_name + ".gd", FileAccess.WRITE)
	save_data.store_string(data)
	save_data.close()
