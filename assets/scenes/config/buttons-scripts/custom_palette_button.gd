extends TextureButton

# Button that sends the player to the CustomPalette scene

func _ready() -> void:
	# Connect button signal
	pressed.connect(_on_pressed)
	
func _on_pressed():
	await Global.save_game()
	Global.change_scene("res://assets/scenes/customPalette/customPalette.tscn", get_tree().current_scene)
