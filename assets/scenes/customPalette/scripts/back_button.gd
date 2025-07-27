extends TextureButton

# Button that sends the user back to config scene

func _ready() -> void:
	# Connect button signal
	pressed.connect(_on_pressed)
	
func _on_pressed():
	await Global.save_game()
	# Timeout to make it safer
	await get_tree().create_timer(0.01).timeout
	# Changes scene to config
	Global.change_scene("res://assets/scenes/config/Config.tscn", get_tree().current_scene)
