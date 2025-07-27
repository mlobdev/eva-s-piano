extends TextureButton

# Button that confirms the custom palette

func _ready() -> void:
	# Connect signal
	pressed.connect(_on_pressed)
	
func _on_pressed():
	# Gets the index of the palette
	var focused_palette : int = $"../../../FocusPalettesObserver".focused_palette
	for color in Global.game_data["Palette"]:
		# Changes the actual color for the actual custom palette color
		Global.game_data["Palette"][color] = Global.game_data["CustomPalettes"]["palette_" + str(focused_palette)]["custom_" + color]
	Global.set_shader_parameters() # Update parameters
	Global.save_game() # Save game
