extends Node

# GlobalColorDataManager

func change_shaders_global_color(parameter : StringName, new_color : Color):
	# Changes to a specific color
	RenderingServer.global_shader_parameter_set(parameter, new_color)

func set_shaders_global_color(palette_index : int):
	# Is called in FocusPalettesManager
	# Change the Global colors that are shown in the entire app
	var palette = Global.game_data["CustomPalettes"]["palette_" + str(palette_index)]
	for color_key in palette:
		change_shaders_global_color(color_key, palette[color_key])
