extends Node

var data_path : String = "user://data.dat"
var paused : bool = false

# Game data to save
var game_data : Dictionary = {
	"Wrappers" : {
		"Wrapper0" : {
			"type" : 2,
			"octave" : 4,
			"instrument" : 0
		},
		"Wrapper1" : {
			"type" : 2,
			"octave" : 5,
			"instrument" : 0
		},
		"Wrapper2" : {
			"type" : 2,
			"octave" : 5,
			"instrument" : 0
		},
		"Wrapper3" : {
			"type" : 0,
			"octave" : 4,
			"instrument" : 0
		},
		"Wrapper4" : {
			"type" : 1,
			"octave" : 4,
			"instrument" : 0
		},
		"Wrapper5" : {
			"type" : 0,
			"octave" : 5,
			"instrument" : 0
		},
		"Wrapper6" : {
			"type" : 2,
			"octave" : 3,
			"instrument" : 0
		},
		"Wrapper7" : {
			"type" : 2,
			"octave" : 3,
			"instrument" : 0
		},
		"Wrapper8" : {
			"type" : 2,
			"octave" : 4,
			"instrument" : 0
		}
	},
	"Effects" : {
		"Sustain" : 0,
		"Tremolo" : 0,
		"Echo" : 0
	},
	"Palette" : {
		"main_color" : Color.WHITE,
		"accent_color" : Color.BLACK,
		"background_color": Color.WHITE,
		"shadow_color" : Color.WHITE,
		"highlight_color" : Color.BLACK
	},
	"CustomPalettes": {
		"palette_0": {
			"custom_main_color" : Color.GRAY,
			"custom_accent_color" : Color.BLACK,
			"custom_background_color": Color.WHITE,
			"custom_shadow_color" : Color.WHITE,
			"custom_highlight_color" : Color.BLACK
		},
		"palette_1": {
			"custom_main_color" : Color.GRAY,
			"custom_accent_color" : Color.BLACK,
			"custom_background_color": Color.WHITE,
			"custom_shadow_color" : Color.WHITE,
			"custom_highlight_color" : Color.BLACK
		},
		"palette_2": {
			"custom_main_color" : Color.GRAY,
			"custom_accent_color" : Color.BLACK,
			"custom_background_color": Color.WHITE,
			"custom_shadow_color" : Color.WHITE,
			"custom_highlight_color" : Color.BLACK
		},
	}
}

func _ready() -> void:
	load_game()
	set_shader_parameters()

func save_game():
	var save_file = FileAccess.open(data_path, FileAccess.WRITE)
	save_file.store_var(game_data)
	save_file = null

func load_game():
	if !FileAccess.file_exists(data_path):
		return
	var save_file = FileAccess.open(data_path, FileAccess.READ)
	game_data = save_file.get_var()
	save_file = null

func change_scene(path : String, old_scene : Node):
	var new_scene : PackedScene = load(path)
	var instance = new_scene.instantiate()
	get_tree().root.add_child(instance)
	get_tree().current_scene = instance
	old_scene.queue_free()

func set_shader_parameters():
	for color in game_data["Palette"]:
		RenderingServer.global_shader_parameter_set(color, game_data["Palette"][color])
