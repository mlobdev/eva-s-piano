extends Node

# Manage the specific colours

func change_specific_color(obj : Object, new_color : Color):
	# Changes a specific color
	if obj.name == "custom_main_color":
		# If it changes the custom_main_color it must also changet the specific_color of the shader
		# since it wouldn't be changed until set_specific_colors() is called 
		# when custom palette is chanegd
		var palette_color : TextureButton = $"../ButtonsContainer".get_child($"../FocusPalettesObserver".focused_palette+2).get_child(0)
		palette_color.material.set_shader_parameter("specific_color", new_color)
	obj.material.set_shader_parameter("specific_color", new_color)

func set_specific_colors() -> void:
	# Changes all specific colours
	# NOTE: specific color is a variable inside shaders
	var index : int = $"../FocusPalettesObserver".focused_palette
	for i in range(5):
		var button_color : TextureButton = $"../ColorsContainers".get_child(i).get_child(0)
		change_specific_color(button_color, Global.game_data["CustomPalettes"]["palette_" + str(index)][button_color.name])
	
	for i in range(2, 5):
		var palette_color : TextureButton = $"../ButtonsContainer".get_child(i).get_child(0)
		# Get the main and highlight colors from each palette preview
		var color_0 : Color = Global.game_data["CustomPalettes"]["palette_" + str(i-2)]["custom_main_color"]
		var color_1 : Color = Global.game_data["CustomPalettes"]["palette_" + str(i-2)]["custom_highlight_color"]
		# Set the main color on the button
		change_specific_color(palette_color, color_0)
		
		palette_color.material.set_shader_parameter("specific_color2", color_1)
	$"../GCDM".set_shaders_global_color(index)
