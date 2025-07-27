extends TextureButton

func _ready() -> void:
	# Connect button signal
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	change_paused() # Change paused to avoid pressing any button while changing scene
	await get_tree().create_timer(0.001).timeout # Cooldown to make it safer
	Global.change_scene("res://assets/scenes/config/Config.tscn", get_tree().current_scene)
	
func change_paused():
	# Change the state paused to its opposite
	Global.paused = !Global.paused
