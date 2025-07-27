extends TextureButton

# Button that returns the player to the piano scene

func _ready() -> void:
	# Connect button signal
	pressed.connect(_on_pressed)
	
func _on_pressed():
	await Global.save_game()
	# Small delay to ensure save completes and scene transition is stable
	await get_tree().create_timer(0.01).timeout
	Global.change_scene("res://assets/scenes/globals/Piano.tscn", get_tree().current_scene)
