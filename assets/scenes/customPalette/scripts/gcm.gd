extends Node

# GlobalColorManager

func change_global_color(new_color : Color, index : int, reference : String) -> void:
	# Store the new color of the specific custom palette in game data
	Global.game_data["CustomPalettes"]["palette_" + str(index)][reference] = new_color
